//
//  personalInformationViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/10/22.
//

import Foundation

protocol personalInformationViewControllerDelegate: Any{
    func assigningText(text: String, indexPath: IndexPath)
}

class PersonalInformationViewModel {
    
    var personalDetails : PersonalInformation!
    
    var personalInformationDelegate: personalInformationViewControllerDelegate?
    
}
