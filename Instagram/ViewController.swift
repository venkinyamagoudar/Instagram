//
//  ViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    //Posts
    var userFollowingPosts: UserFollowingPosts!
    var postDetails = [UserFollowingPostsDetails]()
    var extractedImage: [UIImage]!
    
    //Story
    var userFollowingStories: UserFollowingStories!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(messageButton)), UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraButton))]
        
        self.tableView.register(UINib(nibName: "HomePagePostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        self.tableView.register(StoryTableViewCell.nib(), forCellReuseIdentifier: StoryTableViewCell.identifier)
        tableView.reloadData()
    }
     
    override func viewWillAppear(_ animated: Bool) {
        //Post
        let postJsonData = readLocalJsonFile(fileName:"UserFollowingPosts")
        let decoder = JSONDecoder()
        var parsedPostData : UserFollowingPosts!
        do {
            parsedPostData = try decoder.decode(UserFollowingPosts.self, from: postJsonData!)
        } catch {
            print("error while parsing \(error)")
        }
        self.userFollowingPosts = parsedPostData
        self.postDetails = userFollowingPosts.mediaInPostSection
        
        
        //Story
        let storyJsonData = readLocalJsonFile(fileName: "UserFollowingStories")
        var parsedStoryData: UserFollowingStories!
        do{
            parsedStoryData = try decoder.decode(UserFollowingStories.self, from: storyJsonData!)
        }catch{
            print("error \(error)")
        }
        userFollowingStories = parsedStoryData
    }
    
    
    func readLocalJsonFile(fileName: String) -> Data?{
        do {
            if let path = Bundle.main.path(forResource: fileName, ofType: "json"){
                let fileURL = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        } catch {
            print("error \(error)")
        }
        return nil
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
    
    // table View Delegate functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {return UITableViewCell() }
        if indexPath.row == 0 {
            let storyCell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as! StoryTableViewCell
            storyCell.configure(model: userFollowingStories)
            storyCell.storyDelegate = self
            return storyCell
        } else {
            let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! HomePagePostTableViewCell
            postCell.postPageDelegate = self
            postCell.postedUserProfile.image = getImageData(imageURL: self.postDetails[indexPath.row].followingUserProfilePicture)
            postCell.postedUserName.text = self.postDetails[indexPath.row].followingUserUsername
            postCell.postedImageName.image = getImageData(imageURL: self.postDetails[indexPath.row].followingUserPostURL)
            return postCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat!
        if indexPath.row == 0 {
            height = 120
        } else {
            height = 250
        }
        return height
    }
    
    
    // bar buttons
    
    @objc func cameraButton() {
        
        let galleryViewController = self.storyboard!.instantiateViewController(withIdentifier: "GalleryViewController")
        self.navigationController!.pushViewController(galleryViewController, animated: true)
    }
    
    @objc func messageButton() {
        
        let messageViewController = self.storyboard!.instantiateViewController(withIdentifier: "MessageTableViewController") as! MessageTableViewController
        self.navigationController!.pushViewController(messageViewController, animated: true)
    }

    
    //tap story
    
//    func didTapStoryCell(with image: UIImage) {
//        print("image tapped")
//        let nextController = StoryDetailViewController(nibName: "StoryDetailViewController", bundle: nil)
//        self.navigationController?.pushViewController(nextController, animated: true)
//    }
}

extension ViewController : StoryTableViewCellDelegate {
    func didTapStoryCellTable(with model: [UserStoryFollowingDetails], indexpath: IndexPath) {
        print("image")
        let vc = StoryDetailViewController()
        guard model != nil else {
            return
        }
        vc.configure(model: model, indexpath: indexpath)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}


extension ViewController : HomePagePostTableViewCellDelegate {
    func didTapLabelAndProfile() {
        let vc = OthersProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}



