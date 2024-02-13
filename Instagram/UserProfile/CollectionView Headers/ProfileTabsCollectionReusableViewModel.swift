//
//  ProfileTabsCollectionReusableViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation

protocol ProfileTabsCollectionReusableViewDelegate : AnyObject {
    func didTapPostButton(_ header: ProfileTabsCollectionReusableView)
    func didTapTaggedButton(_ header: ProfileTabsCollectionReusableView)
}

class ProfileTabsCollectionReusableViewModel{
    public weak var delegateTab : ProfileTabsCollectionReusableViewDelegate?
}
