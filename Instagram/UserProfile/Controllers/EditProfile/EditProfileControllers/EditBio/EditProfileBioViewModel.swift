//
//  EditProfileBioViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/10/22.
//

import Foundation

protocol EditProfileBioViewControllerDelegate: Any{
    func saveBio(text: String)
}

class EditProfileBioViewModel{
    
    var editBioDelegate : EditProfileBioViewControllerDelegate?
}
