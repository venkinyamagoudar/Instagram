//
//  ProfileInfoHeaderCollectionReusableViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation
import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate : AnyObject {
    func ProfileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapDiscoverPeopleButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func userInformationFunction(_ userInformation: UserInformation, headerProfileImage: UIImage, _ followersCount: FollowersCount,_ followingCount: FollowingCount,_ postCount: PostCount)
}

class ProfileInfoHeaderCollectionReusableViewModel{
    
    var userInformation : UserInformation!
    var followingCount : FollowingCount!
    var followersCount: FollowersCount!
    var postCount: PostCount!
    
    public weak var delegateProfile : ProfileInfoHeaderCollectionReusableViewDelegate?
}
