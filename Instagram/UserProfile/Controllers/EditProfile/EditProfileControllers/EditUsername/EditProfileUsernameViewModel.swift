//
//  EditProfileUsernameViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/10/22.
//

import Foundation
protocol EditProfileUsernameViewControllerDelegate: Any{
    func saveUserName(text: String)
}

class EditProfileUsernameViewModel{
    var editProfileUsernameViewControllerDelegate: EditProfileUsernameViewControllerDelegate?
}
