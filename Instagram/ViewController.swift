//
//  ViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var homeViewModel = HomeViewModel()
    
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
        let parsedPostData = homeViewModel.readLocalJsonFile(fileName:"UserFollowingPosts", dataType: UserFollowingPosts.self)
       
        self.homeViewModel.userFollowingPosts = parsedPostData
        self.homeViewModel.postDetails = homeViewModel.userFollowingPosts.mediaInPostSection
        
        
        //Story
        let parsedStoryData = homeViewModel.readLocalJsonFile(fileName: "UserFollowingStories",dataType:UserFollowingStories.self)
        homeViewModel.userFollowingStories = parsedStoryData
    }

    // table View Delegate functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.postDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {return UITableViewCell() }
        if indexPath.row == 0 {
            let storyCell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as! StoryTableViewCell
            storyCell.storyTableViewModel.configure(model: homeViewModel.userFollowingStories)
            storyCell.storyTableViewModel.storyDelegate = self
            return storyCell
        } else {
            let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! HomePagePostTableViewCell
            postCell.homePagePostTableViewModel.postPageDelegate = self
            postCell.postedUserProfile.image = homeViewModel.getImageData(imageURL: self.homeViewModel.postDetails[indexPath.row].followingUserProfilePicture)
            postCell.postedUserName.text = self.homeViewModel.postDetails[indexPath.row].followingUserUsername
            postCell.postedImageName.image = homeViewModel.getImageData(imageURL: self.homeViewModel.postDetails[indexPath.row].followingUserPostURL)
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



