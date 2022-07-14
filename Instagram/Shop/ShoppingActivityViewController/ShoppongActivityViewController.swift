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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
