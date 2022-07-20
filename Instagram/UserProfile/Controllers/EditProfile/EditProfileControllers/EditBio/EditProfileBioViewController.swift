//
//  EditProfileBioViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditProfileBioViewController: UIViewController {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
