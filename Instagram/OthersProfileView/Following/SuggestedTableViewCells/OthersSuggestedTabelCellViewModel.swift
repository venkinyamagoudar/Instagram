//
//  OthersSuggestedTabelCellViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation

protocol OthersSuggestedTableViewCellDelegate {
    func removeCellFromTableMethod()
}

class OthersSuggestedTabelCellViewModel{
    public var cellDelegate : OthersSuggestedTableViewCellDelegate?
}
