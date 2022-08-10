//
//  CameraViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import AVFoundation
import UIKit

class CameraViewModel {
//    let captureSession = AVCaptureSession()
//    var previewLayer: CALayer!
//    var captureDevice: AVCaptureDevice!
//    
//    var photoTaken = false
//    
//    func prepareCamera() {
//        captureSession.sessionPreset = AVCaptureSession.Preset.photo
//        
//        if let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInMicrophone], mediaType: AVMediaType.video, position: .back).devices.first {
//            captureDevice = availableDevices
//            beginSession()
//        }
//    }
//    
//    func beginSession() {
//        do {
//            let captureDeviceInput =  try AVCaptureDeviceInput(device: captureDevice)
//            captureSession.addInput(captureDeviceInput)
//        } catch {
//            print(error.localizedDescription)
//        }
//        
//        let cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
//        self.previewLayer = cameraPreviewLayer
////
//        self.previewLayer.frame = view.layer.frame
//        captureSession.startRunning()
//        
//        let dataOutput = AVCaptureVideoDataOutput()
//        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as String): NSNumber(value: kCVPixelFormatType_32BGRA)]
//        
//        dataOutput.alwaysDiscardsLateVideoFrames = true
//        
//        if captureSession.canAddOutput(dataOutput){
//            captureSession.addOutput(dataOutput)
//        }
//        captureSession.commitConfiguration()
//        
//        
//    }
//    
//    @IBAction func takePhoto(_ sender: Any){
//        photoTaken = true
//    }
//    
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        
//        if photoTaken {
//            photoTaken = false
//            //getImageFromSampleBuffer
//            if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer){
//                let photoVC = PhotoViewController(nibName: PhotoViewController.identifier, bundle: nil)
//                photoVC.takenPhoto = image
//                DispatchQueue.main.async {
//                    //connect to photoviewcontroller
//                    self.present(photoVC, animated: true, completion: {
//                        self.stopCaptureSession()
//                    })
//                    
//                }
//            }
//        }
//    
//    }
//    
//    func getImageFromSampleBuffer (buffer: CMSampleBuffer) -> UIImage? {
//        if let pixelBuffer = CMSampleBufferGetImageBuffer(buffer) {
//            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
//            let context = CIContext()
//            
//            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
//            if let image = context.createCGImage(ciImage, from: imageRect){
//                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
//            }
//        }
//        return nil
//    }
//    
//    func stopCaptureSession() {
//        self.captureSession.stopRunning()
//        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput] {
//            for input in inputs {
//                self.captureSession.removeInput(input)
//            }
//        }
//    }
}
