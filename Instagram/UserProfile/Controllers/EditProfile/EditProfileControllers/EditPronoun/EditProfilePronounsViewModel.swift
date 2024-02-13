//
//  EditProfilePronounsViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/10/22.
//

import Foundation

protocol  EditProfilrPronounsViewControllerDelegate: Any{
    func savePronoun(text: String)
}

class EditProfilePronounsViewModel{
    
    var editProfilrPronounsViewControllerDelegate: EditProfilrPronounsViewControllerDelegate?
}
