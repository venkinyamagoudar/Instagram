//
//  EditProfileUsernameViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditProfileUsernameViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var editProfileUsernameViewModel = EditProfileUsernameViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNameMethod))
    }
    
    @objc func saveNameMethod() {
        self.editProfileUsernameViewModel.editProfileUsernameViewControllerDelegate?.saveUserName(text: textField.text!)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func crossButtonPressed(_ sender: Any) {
        textField.text = ""
    }
}

extension EditProfileUsernameViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.editProfileUsernameViewModel.editProfileUsernameViewControllerDelegate?.saveUserName(text: textField.text!)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.editProfileUsernameViewModel.editProfileUsernameViewControllerDelegate?.saveUserName(text: textField.text!)
    }
}
