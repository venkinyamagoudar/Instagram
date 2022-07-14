//
//  PhotoViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/29/22.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var takenPhoto: UIImage!
    static var identifier = "PhotoViewController"
    
    static func nib() -> UINib {
        return UINib(nibName: "PhotoViewController", bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let availablePhoto = takenPhoto {
            imageView.image = availablePhoto
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        print("photo saved")
    }
}
