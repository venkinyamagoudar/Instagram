//
//  ProfileTabsCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/12/22.
//

import UIKit



class ProfileTabsCollectionReusableView: UICollectionReusableView {

    static var identifier = "ProfileTabsCollectionReusableView"
    
    var profileTabsViewModel = ProfileTabsCollectionReusableViewModel()
    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var taggedButton: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileTabsCollectionReusableView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func postsButtonTapped(_ sender: Any) {
        profileTabsViewModel.delegateTab?.didTapPostButton(self)
        postButton.tintColor = .black
        taggedButton.tintColor = .gray
    }
    
    
    @IBAction func taggedButtonTapped(_ sender: Any) {
        profileTabsViewModel.delegateTab?.didTapTaggedButton(self)
        postButton.tintColor = .gray
        taggedButton.tintColor = .black
    }
}
