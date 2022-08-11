//
//  EditProfilePronounsViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit



class EditProfilePronounsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var editProfilePronounViewModel = EditProfilePronounsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveNameMethod))
    }
    
    @objc func saveNameMethod() {
        
        self.editProfilePronounViewModel.editProfilrPronounsViewControllerDelegate?.savePronoun(text: textField.text!)
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func crossButtonPressed(_ sender: Any) {
        textField.text = ""
    }
}

extension EditProfilePronounsViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.editProfilePronounViewModel.editProfilrPronounsViewControllerDelegate?.savePronoun(text: textField.text!)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.editProfilePronounViewModel.editProfilrPronounsViewControllerDelegate?.savePronoun(text: textField.text!)
    }
}
