//
//  ProfileTabsCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/12/22.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate : AnyObject {
    func didTapPostButton(_ header: ProfileTabsCollectionReusableView)
    func didTapTaggedButton(_ header: ProfileTabsCollectionReusableView)
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {

    static var identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegateTab : ProfileTabsCollectionReusableViewDelegate?
    
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
        delegateTab?.didTapPostButton(self)
        postButton.tintColor = .black
        taggedButton.tintColor = .gray
    }
    
    
    @IBAction func taggedButtonTapped(_ sender: Any) {
        delegateTab?.didTapTaggedButton(self)
        postButton.tintColor = .gray
        taggedButton.tintColor = .black
    }
}
