//
//  OtherProfileHeaderCollectionReusableViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation

protocol OtherProfileHeaderCollectionReusableViewDelegate: AnyObject {
    func didTapNumberOfPostsButton()
    func didTapNumberOfFollwers()
    func didTapNumberOfFollowing()
    func didTapFollowingButton()
    func didTapMessageButton()
    func didTapSuggestionButton()
}

class OtherProfileHeaderCollectionReusableViewModel{
    
    public weak var otherProfileDelegate: OtherProfileHeaderCollectionReusableViewDelegate?
    
}
