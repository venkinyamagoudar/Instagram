//
//  ListOfFollowersViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/13/22.
//

import UIKit

class ListOfFollowersViewController: UIViewController {
    
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
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        followersButton.addTarget(self, action: #selector(followersButtonTapped), for: .touchUpInside)
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
        followingButton.addTarget(self, action: #selector(followingButtonTapped), for: .touchUpInside)
        mainButtonView.addSubview(followingButton)
        
    }
    
}


extension ListOfFollowersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && section == 1{
            return 1
        } else if section == 2{
            return 30
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
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        switch section {
//        case 0:
//            return CGFloat(80)
//        case 1:
//            return CGFloat(120)
//        case 2:
//            return CGFloat(40)
//        default:
//            return CGFloat(0)
//        }
//
//    }
    
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
                return cell
            }
        } else if tableView == followingTableView {
            if indexPath.row == 0{
                let cell = followingTableView.dequeueReusableCell(withIdentifier: CategoriesFollowingTableViewCell.identifier, for: indexPath) as! CategoriesFollowingTableViewCell
                return cell
            } else {
                let cell = followingTableView.dequeueReusableCell(withIdentifier: FollowingTableViewCell.identifier, for: indexPath) as! FollowingTableViewCell
                return cell
            }
        }
        return UITableViewCell()
    }

    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        switch section {
//        case 0:
//            header1 = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
//            header1.backgroundColor = .systemBackground
//            followersSearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25))
//            header1.addSubview(followersSearchBar)
//
//
//
//            return header1
//        case 1:
////            header2 = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 120))
////            header2.backgroundColor = .blue
////            return header2
//            return UIView()
//        case 2:
////            header3 = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
////            header3.backgroundColor = .cyan
////            return header3
//            return UIView()
//        default:
//            return UIView()
//        }
//    }
    
    @objc func followingButtonTapped() {
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
        
        
    }
    
    @objc func followersButtonTapped() {
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


extension ListOfFollowersViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
