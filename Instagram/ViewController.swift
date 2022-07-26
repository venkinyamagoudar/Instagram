//
//  ViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(messageButton)), UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraButton))]
        
        self.tableView.register(UINib(nibName: "HomePagePostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        self.tableView.register(UINib(nibName: "StoryTableViewCell", bundle: nil), forCellReuseIdentifier: "StoryTableViewCell")
        
    }
     
    override func viewWillAppear(_ animated: Bool) {

    }
    
    
    // table View Delegate functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {return UITableViewCell() }
        if indexPath.row == 0 {
            let storyCell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as! StoryTableViewCell
            storyCell.storyDelegate = self
            return storyCell
        } else {
            let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! HomePagePostTableViewCell
            postCell.postPageDelegate = self
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
    func didTapStoryCellTable(with image: UIImage) {
        print("image")
        let vc = StoryDetailViewController()
        //vc.storyImage.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController : HomePagePostTableViewCellDelegate {
    func didTapLabelAndProfile() {
        let vc = OthersProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
