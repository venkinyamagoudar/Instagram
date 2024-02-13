//
//  OtherProfileTabCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

class OtherProfileTabCollectionReusableView: UICollectionReusableView {

    static var identifier = "OtherProfileTabCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherProfileTabCollectionReusableView", bundle: nil)
    }
    var OtherProfileTabViewModel = OtherProfileTabCollectionReusableViewModel()
    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var videoListButton: UIButton!
    @IBOutlet weak var taggedListButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .systemBackground
    }
    
    @IBAction func didTapPostsButton(_ sender: Any) {
        postButton.tintColor = .black
        videoListButton.tintColor = .lightGray
        taggedListButton.tintColor = .lightGray
        OtherProfileTabViewModel.otherProfileTabDelegate?.didTapPostButton()
    }
    
    @IBAction func didTapVideosListButton(_ sender: Any) {
        postButton.tintColor = .lightGray
        videoListButton.tintColor = .black
        taggedListButton.tintColor = .lightGray
        OtherProfileTabViewModel.otherProfileTabDelegate?.didTapVideoButton()
    }
    
    @IBAction func didTapTaggedListButton(_ sender: Any) {
        postButton.tintColor = .lightGray
        videoListButton.tintColor = .lightGray
        taggedListButton.tintColor = .black
        OtherProfileTabViewModel.otherProfileTabDelegate?.didTapTaggedButton()
    }
}
