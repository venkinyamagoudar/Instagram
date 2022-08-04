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
    
    var followingUserDetails = [UserStoryFollowingDetails]()
    
    var image: UIImage!
    var indexPath:IndexPath!
    
    func configure(model: [UserStoryFollowingDetails], indexpath: IndexPath){
        self.followingUserDetails = model
        self.indexPath = indexpath
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        image = getImageData(imageURL: followingUserDetails[indexPath.row].FollowingUserStories[0].storyURL)
        print(indexPath.row)
        storyImage.image = image
    }
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        
    }
    
    func getImageData(imageURL: URL) -> UIImage?{
        do {
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    return image
                }
            }
        }catch{
            print("error in image \(error)")
        }
        return nil
    }
}
