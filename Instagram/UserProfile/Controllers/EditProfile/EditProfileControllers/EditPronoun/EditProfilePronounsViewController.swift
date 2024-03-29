//
//  EditProfilePronounsViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditProfilePronounsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNameMethod))
    }
    
    @objc func saveNameMethod() {
        print("save details")
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func crossButtonPressed(_ sender: Any) {
        textField.text = ""
    }

}
