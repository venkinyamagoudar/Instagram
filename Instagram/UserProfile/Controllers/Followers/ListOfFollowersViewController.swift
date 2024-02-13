//
//  ListOfFollowersViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/13/22.
//

import UIKit

class ListOfFollowersViewController: UIViewController {
    
    var listOfFollowersViewModel = ListOfFollowersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Username"
        
        listOfFollowersViewModel.followersTableView.delegate = self
        listOfFollowersViewModel.followersTableView.dataSource = self
        
        listOfFollowersViewModel.followingTableView.delegate = self
        listOfFollowersViewModel.followingTableView.dataSource = self
        
        // Button Creation
        buttonGrid()
        
        //followers table cells
        listOfFollowersViewModel.followersTableView.register(FollowersTableViewCell.nib(), forCellReuseIdentifier: FollowersTableViewCell.identifier)
        listOfFollowersViewModel.followersTableView.register(HeaderTableViewCell.nib(), forCellReuseIdentifier: HeaderTableViewCell.identifier)
        listOfFollowersViewModel.followersTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
        //following table cells
        listOfFollowersViewModel.followingTableView.register(FollowingTableViewCell.nib(), forCellReuseIdentifier: FollowingTableViewCell.identifier)
        listOfFollowersViewModel.followingTableView.register(CategoriesFollowingTableViewCell.nib(), forCellReuseIdentifier: CategoriesFollowingTableViewCell.identifier)
        
        self.listOfFollowersViewModel.followersSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //following User details
        let parsedFollowingData = listOfFollowersViewModel.extractDataFromJson(fileName: "FollowingList", dataType: UserFollowingInformation.self)
        listOfFollowersViewModel.userFollowingInformation = parsedFollowingData
        listOfFollowersViewModel.followingUserDetails = listOfFollowersViewModel.userFollowingInformation.followingDetails
        
        //followers details
        let parsedFollowersdata = listOfFollowersViewModel.extractDataFromJson(fileName: "FollowersList", dataType: UserFollowersInformation.self)
        listOfFollowersViewModel.userFollowersInformation = parsedFollowersdata.self
        listOfFollowersViewModel.followersUserDetails = listOfFollowersViewModel.userFollowersInformation.followerDetails

        
    }
    
    func buttonGrid() {
        listOfFollowersViewModel.mainButtonView = UIView(frame: CGRect(x: 0,
                                              y: 90,
                                              width: self.view.frame.width,
                                              height: 40)
        )
        listOfFollowersViewModel.mainButtonView.backgroundColor = .blue
        view.addSubview(listOfFollowersViewModel.mainButtonView)

        listOfFollowersViewModel.followersButton = UIButton(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: self.view.frame.width / 2,
                                                                          height: listOfFollowersViewModel.mainButtonView.frame.height
                                                )
        )
        listOfFollowersViewModel.followersButton.backgroundColor = .systemBackground
        listOfFollowersViewModel.followersButton.setTitle("followers", for: .normal)
        listOfFollowersViewModel.followersButton.setTitleColor(UIColor.black, for: .normal)
        listOfFollowersViewModel.followersButton.addTarget(self, action: #selector(followingOrFollowersButtonTapped), for: .touchUpInside)
        listOfFollowersViewModel.mainButtonView.addSubview(listOfFollowersViewModel.followersButton)

        listOfFollowersViewModel.followingButton = UIButton(frame: CGRect(x: listOfFollowersViewModel.mainButtonView.frame.width / 2,
                                                 y: 0,
                                                 width: self.view.frame.width / 2,
                                                                          height: listOfFollowersViewModel.mainButtonView.frame.height
                                                )
        )
        listOfFollowersViewModel.followingButton.setTitle("following", for: .normal)
        listOfFollowersViewModel.followingButton.setTitleColor(UIColor.black, for: .normal)
        listOfFollowersViewModel.followingButton.backgroundColor = .systemBackground
        listOfFollowersViewModel.followingButton.addTarget(self, action: #selector(followingOrFollowersButtonTapped), for: .touchUpInside)
        listOfFollowersViewModel.mainButtonView.addSubview(listOfFollowersViewModel.followingButton)

    }
    
}

//MARK: EXTENSIONS TableView
extension ListOfFollowersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && section == 1{
            return 1
        } else if section == 2{
            if tableView == listOfFollowersViewModel.followingTableView{
                return listOfFollowersViewModel.followingUserDetails.count
            } else {
                return listOfFollowersViewModel.followersUserDetails.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == listOfFollowersViewModel.followersTableView {
            switch indexPath.row {
                case 0:
                    return CGFloat(96)
                case 1:
                    return CGFloat(170)
                default:
                    return CGFloat(50)
            }
        } else if tableView == listOfFollowersViewModel.followingTableView {
            switch indexPath.row {
            case 0:
                return CGFloat(204)
            default:
                return CGFloat(50)
            }
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == listOfFollowersViewModel.followersTableView {
            if indexPath.row == 0{
                let cell = listOfFollowersViewModel.followersTableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as! HeaderTableViewCell
                return cell
            } else if indexPath.row == 1{
                let cell = listOfFollowersViewModel.followersTableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
                return cell
            } else {
                let cell = listOfFollowersViewModel.followersTableView.dequeueReusableCell(withIdentifier: FollowersTableViewCell.identifier, for: indexPath) as! FollowersTableViewCell
                cell.backgroundColor = .systemBackground
                cell.usernameLabel.text = listOfFollowersViewModel.followersUserDetails[indexPath.row].followerUsername
                cell.nameLabel.text = listOfFollowersViewModel.followersUserDetails[indexPath.row].followerName
                cell.profilePhotoView.image = listOfFollowersViewModel.extractImageFromURL(imageURL: self.listOfFollowersViewModel.followersUserDetails[indexPath.row].followerProfileHd)
                return cell
            }
        } else if tableView == listOfFollowersViewModel.followingTableView {
            if indexPath.row == 0{
                let cell = listOfFollowersViewModel.followingTableView.dequeueReusableCell(withIdentifier: CategoriesFollowingTableViewCell.identifier, for: indexPath) as! CategoriesFollowingTableViewCell
                return cell
            } else {
                let cell = listOfFollowersViewModel.followingTableView.dequeueReusableCell(withIdentifier: FollowingTableViewCell.identifier, for: indexPath) as! FollowingTableViewCell
                cell.nameLabel.text = listOfFollowersViewModel.followingUserDetails[indexPath.row].followingUsername
                cell.usernameLabel.text = listOfFollowersViewModel.followingUserDetails[indexPath.row].followingName
                cell.profileImageView.image = listOfFollowersViewModel.extractImageFromURL(imageURL: listOfFollowersViewModel.followingUserDetails[indexPath.row].followingProfileHd)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    @objc func followingOrFollowersButtonTapped(sender: UIButton) {
        if sender == listOfFollowersViewModel.followingButton{
            self.listOfFollowersViewModel.followersTableView.isHidden = true
            self.listOfFollowersViewModel.followingTableView.isHidden = false
            
            
            listOfFollowersViewModel.followingButton.setTitleColor(.black, for: .normal)
            listOfFollowersViewModel.followersButton.setTitleColor(.gray, for: .normal)
            
            listOfFollowersViewModel.followingTableView.frame = CGRect(x: 0,
                                              y: 130,
                                              width: self.view.frame.width,
                                              height: 636
            )
            self.view.addSubview(listOfFollowersViewModel.followingTableView)
        }else {
            self.listOfFollowersViewModel.followersTableView.isHidden = false
            self.listOfFollowersViewModel.followingTableView.isHidden = true
            
            listOfFollowersViewModel.followingButton.setTitleColor(.gray, for: .normal)
            listOfFollowersViewModel.followersButton.setTitleColor(.black, for: .normal)
            
            listOfFollowersViewModel.followersTableView.frame = CGRect(x: 0,
                                              y: 130,
                                              width: self.view.frame.width,
                                              height: 637
            )
            self.view.addSubview(listOfFollowersViewModel.followersTableView)
        }
    }
}

//MARK: EXTENSIONS Search Bar

extension ListOfFollowersViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
