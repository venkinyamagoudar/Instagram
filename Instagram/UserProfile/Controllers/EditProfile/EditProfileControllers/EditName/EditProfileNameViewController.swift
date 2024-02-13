//
//  EditProfileNameViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditProfileNameViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var editProfileNameViewModel = EditProfileNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNameMethod))
    }
    
    @objc func saveNameMethod() {
        editProfileNameViewModel.editProfileNameViewControllerDelegate?.saveName(text: textField.text!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func CrossButtonPressed(_ sender: Any) {
        textField.text = ""
    }
}

extension EditProfileNameViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editProfileNameViewModel.editProfileNameViewControllerDelegate?.saveName(text: textField.text!)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editProfileNameViewModel.editProfileNameViewControllerDelegate?.saveName(text: textField.text!)
    }
}
