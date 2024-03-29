//
//  OthersProfileViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

class OthersProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "UserName"
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
        //cell registraion
        collectionView.register(OtherProfileCollectionViewCell.self, forCellWithReuseIdentifier: OtherProfileCollectionViewCell.identifier)
        
        // register Headers
        collectionView.register(OtherProfileHeaderCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherProfileHeaderCollectionReusableView.identifier)
        
        collectionView.register(OtherProfileTabCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherProfileTabCollectionReusableView.identifier)
        
        collectionView.register(OtherProfileStoryCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherProfileStoryCollectionReusableView.identifier)
        
        // Bar Buttons
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(didTapNotificationButton))
        let moreButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(didTapMoreButton))
        navigationItem.rightBarButtonItems = [moreButton, notificationButton]
    }
    
    
    // MARK: Bar BUtton Methods
    
    @objc func didTapNotificationButton() {
        let alertController = UIAlertController(title: "Notification", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Posts", style: .default, handler: getPostNotifications))
        alertController.addAction(UIAlertAction(title: "Stories", style: .default, handler: getStoriesNotification))
        alertController.addAction(UIAlertAction(title: "Reels", style: .default, handler: getReelsNotification))
        alertController.addAction(UIAlertAction(title: "Videos", style: .default, handler: getVideosNotification))
        alertController.addAction(UIAlertAction(title: "LikeVideos", style: .default, handler: getLiveVideoNotification))
        present(alertController, animated: true)
    }
    
    func getPostNotifications(sender: UIAlertAction) {
        print("Post")
    }
    
    func getStoriesNotification(sender: UIAlertAction) {
        print("Stories")
    }
    
    func getReelsNotification(sender: UIAlertAction) {
        print("Reels")
    }
    
    func getVideosNotification(sender: UIAlertAction) {
        print("Videos")
    }
    
    func getLiveVideoNotification(sender: UIAlertAction) {
        print("Live Videos")
    }
    
    @objc func didTapMoreButton() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Restrict", style: .default, handler: didTapRestrict))
        alertController.addAction(UIAlertAction(title: "Block", style: .default, handler: didTapBlock))
        alertController.addAction(UIAlertAction(title: "Report", style: .default, handler: didTapReport))
        alertController.addAction(UIAlertAction(title: "Hide your story", style: .default, handler: didTapHideYourStory))
        alertController.addAction(UIAlertAction(title: "Remove follower", style: .default, handler: didTapRemoveFollower))
        alertController.addAction(UIAlertAction(title: "Copy profile URL", style: .default, handler: didTapCopyProfileURL))
        alertController.addAction(UIAlertAction(title: "Share this profile", style: .default, handler: didTapShareThisProfile))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true)
    }
    
    func didTapRestrict(sender: UIAlertAction) {
        print("Restrict")
    }
    
    func didTapBlock(sender: UIAlertAction) {
        print("Block")
    }
    
    func didTapReport(sender: UIAlertAction) {
        print("Report")
    }
    
    func didTapHideYourStory(sender: UIAlertAction) {
        print("Hide your story")
    }
    
    func didTapRemoveFollower(sender: UIAlertAction) {
        print("Remove follower")
    }
    
    func didTapCopyProfileURL(sender: UIAlertAction) {
        print("Copy profile URL")
    }
    
    func didTapShareThisProfile(sender: UIAlertAction) {
        print("Share this profile")
    }
    
}


extension OthersProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section < 2 {
            return 0
        }
        return 99
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherProfileCollectionViewCell.identifier, for: indexPath) as! OtherProfileCollectionViewCell
        cell.configure(debug: "car")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        let size = (view.frame.width - 50) / 3
        return CGSize(width: size, height: size)
    }
    
    //header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        var size = CGSize()
        if section == 0 {
            size = CGSize(width: collectionView.frame.width, height: 200)
        } else if section == 1{
            size = CGSize(width: collectionView.frame.width, height: 80)
        }else {
            size = CGSize(width: collectionView.frame.width, height: 50)
        }
        return size
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if indexPath.section == 0 {
            let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: OtherProfileHeaderCollectionReusableView.identifier,
                for: indexPath) as! OtherProfileHeaderCollectionReusableView
            profileHeader.otherProfileDelegate = self
            return profileHeader
        } else if indexPath.section == 1 {
            let storyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherProfileStoryCollectionReusableView.identifier, for: indexPath) as! OtherProfileStoryCollectionReusableView

            return storyHeader
        } else {
            let tabHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherProfileTabCollectionReusableView.identifier, for: indexPath) as! OtherProfileTabCollectionReusableView
            tabHeader.otherProfileTabDelegate = self
            return tabHeader
        }
    }
}
//MARK: Extension for Main Header

extension OthersProfileViewController: OtherProfileHeaderCollectionReusableViewDelegate{
    func didTapNumberOfPostsButton() {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 2), at: .top, animated: true)
    }
    
    func didTapNumberOfFollwers() {
        let vc = FollowingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapNumberOfFollowing() {
        let vc = FollowingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapFollowingButton() {
        let alertController = UIAlertController(title: "UserName", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Add to close List Friend", style: .default, handler: addToCloseListFriend))
        alertController.addAction(UIAlertAction(title: "Mute", style: .default, handler: didTapMute))
        alertController.addAction(UIAlertAction(title: "Restrict", style: .default, handler: didTapRestrictButton))
        alertController.addAction(UIAlertAction(title: "Unfollow", style: .default, handler: didTapUnfollow))
        present(alertController, animated: true)
    }
    
    func addToCloseListFriend(sender: UIAlertAction){
        print("add to close friends")
    }
    
    func didTapMute(sender: UIAlertAction){
        print("tap om mute")
    }
    
    func didTapRestrictButton(sender: UIAlertAction){
        print("Tap restrict")
    }
    
    func didTapUnfollow(sender: UIAlertAction){
        print("Tapped on unfollow")
    }
    
    func didTapMessageButton() {
        let vc = ChatViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapSuggestionButton() {
        let vc = SuggestionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Extension for Tab Header

extension OthersProfileViewController: OtherProfileTabCollectionReusableViewDelegate {
    
    func didTapPostButton() {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 2), at: .top, animated: true)
    }
    
    func didTapVideoButton() {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 2), at: .top, animated: true)
    }
    
    func didTapTaggedButton() {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 2), at: .top, animated: true)
    }
}
