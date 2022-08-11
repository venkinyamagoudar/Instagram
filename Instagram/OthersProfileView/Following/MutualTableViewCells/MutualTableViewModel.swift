//
//  MutualTableViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation
import UIKit

protocol MutualTableViewCellDelegate {
    func unfollowButtonMethod(button: UIButton)
    func followButtonMethod(button: UIButton)
}

class MutualTableViewModel{
    public var delegate: MutualTableViewCellDelegate?
}
