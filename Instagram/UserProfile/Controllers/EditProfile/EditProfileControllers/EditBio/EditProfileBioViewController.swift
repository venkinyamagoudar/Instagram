//
//  EditProfileBioViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditProfileBioViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var editProfileBioViewModel = EditProfileBioViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNameMethod))
    }
    
    @objc func saveNameMethod() {
        
        editProfileBioViewModel.editBioDelegate?.saveBio(text: textField.text!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func crossButtonPressed(_ sender: Any) {
        textField.text = ""
    }

}

extension EditProfileBioViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editProfileBioViewModel.editBioDelegate?.saveBio(text: textField.text!)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editProfileBioViewModel.editBioDelegate?.saveBio(text: textField.text!)
    }
}
