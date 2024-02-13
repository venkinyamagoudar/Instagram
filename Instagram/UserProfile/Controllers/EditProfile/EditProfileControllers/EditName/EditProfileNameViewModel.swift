//
//  EditProfileNameViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/10/22.
//

import Foundation
protocol EditProfileNameViewControllerDelegate: Any{
    func saveName(text: String)
}

class EditProfileNameViewModel{
    
    var editProfileNameViewControllerDelegate:EditProfileNameViewControllerDelegate?
}
