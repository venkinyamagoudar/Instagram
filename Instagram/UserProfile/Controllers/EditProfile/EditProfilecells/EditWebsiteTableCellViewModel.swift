//
//  EditWebsiteTableCellViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation

protocol EditWebsiteTableViewCellDelegate: Any{
    func saveWebsite(text: String)
}

class EditWebsiteTableCellViewModel{
    var editWebsiteTableViewCellDelegate: EditWebsiteTableViewCellDelegate?
}
