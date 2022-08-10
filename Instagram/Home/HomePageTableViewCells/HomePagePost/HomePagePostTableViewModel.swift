//
//  HomePagePostTableViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit.UITapGestureRecognizer

protocol HomePagePostTableViewCellDelegate : AnyObject {
    func didTapLabelAndProfile()
}

class HomePagePostTableViewModel{
    
    public var postPageDelegate: HomePagePostTableViewCellDelegate?

}
