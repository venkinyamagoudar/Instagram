//
//  OtherProfileTabCollectionReusableViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation

protocol OtherProfileTabCollectionReusableViewDelegate: AnyObject {
    func didTapPostButton()
    func didTapVideoButton()
    func didTapTaggedButton()
}

class OtherProfileTabCollectionReusableViewModel{
    public weak var otherProfileTabDelegate: OtherProfileTabCollectionReusableViewDelegate?
}
