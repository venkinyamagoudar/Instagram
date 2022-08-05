//
//  ShoppongActivityViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/5/22.
//

import UIKit

class ShoppongActivityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Shopping Activity"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "circle.dashed.inset.filled"), style: .plain, target: self, action: #selector(settings))
    }
    
    @objc func settings() {
        print("setting pressed")
    }

}
