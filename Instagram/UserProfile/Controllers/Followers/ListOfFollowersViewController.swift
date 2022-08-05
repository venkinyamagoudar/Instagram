//
//  ListOfFollowersViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/13/22.
//

import UIKit

class ListOfFollowersViewController: UIViewController {
    
    var userFollowingInformation: UserFollowingInformation!
    var followingUserDetails = [FollowingUserDetails]()
    
    var userFollowersInformation: UserFollowersInformation!
    var followersUserDetails = [FollowerUserDetails]()
    
    
    var mainButtonView = UIView()
    
    var followingButton = UIButton()
    var followersButton = UIButton()
    
    var followersTableView = UITableView()
    var followingTableView = UITableView()
    
    var header1 = UIView()
    var followersSearchBar = UISearchBar()
    
    var header2 = UIView()
    var header3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Username"
        
        followersTableView.delegate = self
        followersTableView.dataSource = self
        
        followingTableView.delegate = self
        followingTableView.dataSource = self
        buttonGrid()
        
        //followers table cells
        followersTableView.register(FollowersTableViewCell.nib(), forCellReuseIdentifier: FollowersTableViewCell.identifier)
        followersTableView.register(HeaderTableViewCell.nib(), forCellReuseIdentifier: HeaderTableViewCell.identifier)
        followersTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
        //following table cells
        followingTableView.register(FollowingTableViewCell.nib(), forCellReuseIdentifier: FollowingTableViewCell.identifier)
        followingTableView.register(CategoriesFollowingTableViewCell.nib(), forCellReuseIdentifier: CategoriesFollowingTableViewCell.identifier)
        
        self.followersSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //following User details
        let followingJsonData = extractDataFromJson(fileName: "FollowingList")
        let decoder = JSONDecoder()
        var parsedFollowingData: UserFollowingInformation!
        do{
            parsedFollowingData = try? decoder.decode(UserFollowingInformation.self, from: followingJsonData!)
        }catch{
            print("error\(error)")
        }
        userFollowingInformation = parsedFollowingData
        followingUserDetails = userFollowingInformation.followingDetails
        
        //followers details
        let followersJsonData = extractDataFromJson(fileName: "FollowersList")
        var parsedFollowersdata : UserFollowersInformation!
        do {
            parsedFollowersdata = try? decoder.decode(UserFollowersInformation.self, from: followersJsonData!)
        } catch{
            print("error\(error)")
        }
        userFollowersInformation = parsedFollowersdata
        followersUserDetails = userFollowersInformation.followerDetails
    }
    
    func extractDataFromJson(fileName: String) -> Data?{
        do {
            if let path = Bundle.main.path(forResource: fileName, ofType: "json"){
                let fileURL = try URL(fileURLWithPath: path)
                let jsonData = try Data(contentsOf: fileURL)
                return jsonData
            }
        } catch {
            print("error \(error)")
        }
        return nil
    }
    
    func extractImageFromURL(imageURL: URL) -> UIImage? {
        do{
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    return image
                }
            }
        } catch {
            print("error \(error)")
        }
        return nil
    }
    
    func buttonGrid() {
        mainButtonView = UIView(frame: CGRect(x: 0,
                                              y: 90,
                                              width: self.view.frame.width,
                                              height: 40)
        )
        mainButtonView.backgroundColor = .blue
        view.addSubview(mainButtonView)
        
        followersButton = UIButton(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: self.view.frame.width / 2,
                                                 height: mainButtonView.frame.height
                                                )
        )
        followersButton.backgroundColor = .systemBackground
        followersButton.setTitle("followers", for: .normal)
        followersButton.setTitleColor(UIColor.black, for: .normal)
        followersButton.addTarget(self, action: #selector(followingOrFollowersButtonTapped), for: .touchUpInside)
        mainButtonView.addSubview(followersButton)
        
        followingButton = UIButton(frame: CGRect(x: mainButtonView.frame.width / 2,
                                                 y: 0,
                                                 width: self.view.frame.width / 2,
                                                 height: mainButtonView.frame.height
                                                )
        )
        followingButton.setTitle("following", for: .normal)
        followingButton.setTitleColor(UIColor.black, for: .normal)
        followingButton.backgroundColor = .systemBackground
        followingButton.addTarget(self, action: #selector(followingOrFollowersButtonTapped), for: .touchUpInside)
        mainButtonView.addSubview(followingButton)
        
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
            if tableView == followingTableView{
                return followingUserDetails.count
            } else {
                return followersUserDetails.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == followersTableView {
            switch indexPath.row {
                case 0:
                    return CGFloat(96)
                case 1:
                    return CGFloat(170)
                default:
                    return CGFloat(50)
            }
        } else if tableView == followingTableView {
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
        
        if tableView == followersTableView {
            if indexPath.row == 0{
                let cell = followersTableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as! HeaderTableViewCell
                return cell
            } else if indexPath.row == 1{
                let cell = followersTableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
                return cell
            } else {
                let cell = followersTableView.dequeueReusableCell(withIdentifier: FollowersTableViewCell.identifier, for: indexPath) as! FollowersTableViewCell
                cell.backgroundColor = .systemBackground
                cell.usernameLabel.text = followersUserDetails[indexPath.row].followerUsername
                cell.nameLabel.text = followersUserDetails[indexPath.row].followerName
                cell.profilePhotoView.image = extractImageFromURL(imageURL: self.followersUserDetails[indexPath.row].followerProfileHd)
                return cell
            }
        } else if tableView == followingTableView {
            if indexPath.row == 0{
                let cell = followingTableView.dequeueReusableCell(withIdentifier: CategoriesFollowingTableViewCell.identifier, for: indexPath) as! CategoriesFollowingTableViewCell
                return cell
            } else {
                let cell = followingTableView.dequeueReusableCell(withIdentifier: FollowingTableViewCell.identifier, for: indexPath) as! FollowingTableViewCell
                cell.nameLabel.text = followingUserDetails[indexPath.row].followingUsername
                cell.usernameLabel.text = followingUserDetails[indexPath.row].followingName
                cell.profileImageView.image = extractImageFromURL(imageURL: followingUserDetails[indexPath.row].followingProfileHd)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    @objc func followingOrFollowersButtonTapped(sender: UIButton) {
        if sender == followingButton{
            self.followersTableView.isHidden = true
            self.followingTableView.isHidden = false
            
            
            followingButton.setTitleColor(.black, for: .normal)
            followersButton.setTitleColor(.gray, for: .normal)
            
            followingTableView.frame = CGRect(x: 0,
                                              y: 130,
                                              width: self.view.frame.width,
                                              height: 636
            )
            self.view.addSubview(followingTableView)
        }else {
            self.followersTableView.isHidden = false
            self.followingTableView.isHidden = true
            
            followingButton.setTitleColor(.gray, for: .normal)
            followersButton.setTitleColor(.black, for: .normal)
            
            followersTableView.frame = CGRect(x: 0,
                                              y: 130,
                                              width: self.view.frame.width,
                                              height: 637
            )
            self.view.addSubview(followersTableView)
        }
    }
}

//MARK: EXTENSIONS Search Bar

extension ListOfFollowersViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
