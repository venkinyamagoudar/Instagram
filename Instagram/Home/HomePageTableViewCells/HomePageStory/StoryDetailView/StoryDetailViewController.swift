//
//  StoryDetailViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/28/22.
//

import UIKit

class StoryDetailViewController: UIViewController {

    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var text: UITextView!
    
    var storyDetailViewModel = StoryDetailViewModel()
    
    func configure(model: [UserStoryFollowingDetails], indexpath: IndexPath){
        storyDetailViewModel.configure(model: model, indexpath: indexpath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        storyImage.image = storyDetailViewModel.image
    }
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        
    }
}
