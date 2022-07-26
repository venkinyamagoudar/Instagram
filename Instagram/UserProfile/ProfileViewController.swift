//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/30/22.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var userInformationProfile : UserInformation!
    var followingCountProfile : FollowingCount!
    var followersCountProfile: FollowersCount!
    var postCountProfile: PostCount!
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        //registering a cell
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        //registering headers
        collectionView.register(ProfileInfoHeaderCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier)
        collectionView.register(ProfileTabsCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabsCollectionReusableView.identifier)
        
        // rightbar buttons
        let reelButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .done, target: self, action: #selector(reelButtonTapped))
        let optionButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(optionsButtonTapped))
        navigationItem.rightBarButtonItems = [optionButton, reelButton]
    
    }
    
    //MARK: - datasource functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return 99
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
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
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier,
                for: indexPath) as! ProfileInfoHeaderCollectionReusableView
            profileHeader.delegateProfile = self
            
            return profileHeader
        } else {
            let tabHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabsCollectionReusableView.identifier, for: indexPath) as! ProfileTabsCollectionReusableView
            tabHeader.delegateTab = self
            return tabHeader
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        var size = CGSize()
        if section == 0 {
            size = CGSize(width: view.frame.width, height: 160)
        } else {
            size = CGSize(width: view.frame.width, height: 50)
        }
        return size
    }
    
    //BarButton
    @objc func reelButtonTapped() {
        let ac = UIAlertController(title: "Create", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reel", style: .default, handler: reels))
        ac.addAction(UIAlertAction(title: "Post", style: .default, handler: post))
        ac.addAction(UIAlertAction(title: "Story", style: .default, handler: story))
        ac.addAction(UIAlertAction(title: "Story highlight", style: .default, handler: storyHistory))
        ac.addAction(UIAlertAction(title: "Live", style: .default, handler: liveVideo))
        ac.addAction(UIAlertAction(title: "Guide", style: .default, handler: guide))
        ac.addAction(UIAlertAction(title: "Fundraiser", style: .default, handler: fundraiser))
        present(ac, animated: true)
        
        
    }
    
    func reels(action: UIAlertAction) {
        print("Go to reels controller")
    }
    
    func post(action: UIAlertAction) {
        print("Go to New post Controller")
    }
    func story(action: UIAlertAction) {
        print("Go to story camera access")
    }
    func storyHistory(action: UIAlertAction) {
        print("History of story")
    }
    func liveVideo(action: UIAlertAction) {
        print("Camera access")
    }
    func guide(action: UIAlertAction) {
        print("guide")
    }
    func fundraiser(action: UIAlertAction) {
        print("Go to non profit co0ntroller")
    }
    
    
    @objc func optionsButtonTapped() {
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Settings", style: .default, handler: settings))
        ac.addAction(UIAlertAction(title: "Your activity", style: .default, handler: yourActivity))
        ac.addAction(UIAlertAction(title: "Archive", style: .default, handler: archive))
        ac.addAction(UIAlertAction(title: "QR code", style: .default, handler: qrCode))
        ac.addAction(UIAlertAction(title: "Cart", style: .default, handler: cart))
        ac.addAction(UIAlertAction(title: "Orders and Payment", style: .default, handler: ordersAndPayment))
        ac.addAction(UIAlertAction(title: "Close Friends", style: .default, handler: closeFriends))
        ac.addAction(UIAlertAction(title: "COVID-19 Informatiomn Center", style: .default, handler: covidInformation))
        present(ac, animated: true)
    }
    
    func settings(action: UIAlertAction) {
        print("Go to settings controller")
    }
    
    func yourActivity(action: UIAlertAction) {
        print("activity")
    }
    func archive(action: UIAlertAction) {
        print("archive")
    }
    func qrCode(action: UIAlertAction) {
        print("qr code")
    }
    func cart(action: UIAlertAction) {
        print("cart controller")
    }
    
    func ordersAndPayment(action: UIAlertAction) {
        print("Go to payment co0ntroller")
    }
    func closeFriends(action: UIAlertAction) {
        print("Closed friends")
    }
    func covidInformation(action: UIAlertAction) {
        print("Covid Information")
    }
    
}


// MARK: ProfileInfoHeaderCollectionReusableViewDelegate

extension ProfileViewController: ProfileInfoHeaderCollectionReusableViewDelegate {
    
    func userInformationFunction(_ userInformation: UserInformation, headerProfileImage: UIImage, _ followersCount: FollowersCount, _ followingCount: FollowingCount, _ postCount: PostCount) {
        self.userInformationProfile = userInformation
        self.postCountProfile = postCount
        self.profileImage = headerProfileImage
    }
    
    func ProfileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        print("Post tapped")
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }
    
    func ProfileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        let vc = ListOfFollowersViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func ProfileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        let vc = ListOfFollowersViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func ProfileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        let vc = EditProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func ProfileHeaderDidTapDiscoverPeopleButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        print("Discover people button tapped")
    }
}


//  MARK: - ProfileTabsCollectionReusableViewDelegate

extension ProfileViewController: ProfileTabsCollectionReusableViewDelegate {
    func didTapPostButton(_ header: ProfileTabsCollectionReusableView) {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }
    
    func didTapTaggedButton(_ header: ProfileTabsCollectionReusableView) {
        print("Tagged button")
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }
    
    
}
