//
//  EditProfileBioViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

protocol EditProfileBioViewControllerDelegate: Any{
    func saveBio(text: String)
}

class EditProfileBioViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var editBioDelegate : EditProfileBioViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNameMethod))
    }
    
    @objc func saveNameMethod() {
        print("save details")
        editBioDelegate?.saveBio(text: textField.text!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func crossButtonPressed(_ sender: Any) {
        textField.text = ""
    }

}

extension EditProfileBioViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editBioDelegate?.saveBio(text: textField.text!)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editBioDelegate?.saveBio(text: textField.text!)
    }
}
