//
//  CameraViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/29/22.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
    
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    var captureDevice: AVCaptureDevice!
    
    var photoTaken = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCamera()

    }

    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        if let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInMicrophone], mediaType: AVMediaType.video, position: .back).devices.first {
            captureDevice = availableDevices
            beginSession()
        }
    }
    
    func beginSession() {
        do {
            let captureDeviceInput =  try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        } catch {
            print(error.localizedDescription)
        }
        
        let cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.previewLayer = cameraPreviewLayer
        self.view.layer.addSublayer(self.previewLayer)
        self.previewLayer.frame = self.view.layer.frame
        captureSession.startRunning()
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as String): NSNumber(value: kCVPixelFormatType_32BGRA)]
        
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dataOutput){
            captureSession.addOutput(dataOutput)
        }
        captureSession.commitConfiguration()
        
        let queue = DispatchQueue(label: "com.venki.captureQueue")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
    }
    
    @IBAction func takePhoto(_ sender: Any){
        photoTaken = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        if photoTaken {
            photoTaken = false
            //getImageFromSampleBuffer
            if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer){
                let photoVC = PhotoViewController(nibName: PhotoViewController.identifier, bundle: nil)
                photoVC.takenPhoto = image
                DispatchQueue.main.async {
                    //connect to photoviewcontroller
                    self.present(photoVC, animated: true, completion: {
                        self.stopCaptureSession()
                    })
                    
                }
            }
        }
    
    }
    
    func getImageFromSampleBuffer (buffer: CMSampleBuffer) -> UIImage? {
        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let context = CIContext()
            
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            if let image = context.createCGImage(ciImage, from: imageRect){
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
        return nil
    }
    
    func stopCaptureSession() {
        self.captureSession.stopRunning()
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput] {
            for input in inputs {
                self.captureSession.removeInput(input)
            }
        }
    }
}
