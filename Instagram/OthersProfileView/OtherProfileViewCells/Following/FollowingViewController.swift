//
//  FollowingViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/15/22.
//

import UIKit

class FollowingViewController: UIViewController {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    var followersTableView = UITableView()
    var followingTableView = UITableView()
    var suggestionTableView = UITableView()
    var mutualTableView = UITableView()
    
    var mutualTableHeader = UIView()
    var followersTableHeader = UIView()
    var followingTableHeader = UIView()
    
    var buttonTrack = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Other User Name"

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        allTableView = UIView(frame: CGRect(x: 0,
//                                            y: 130,
//                                            width: 414,
//                                            height: 635))
//        allTableView.backgroundColor = .blue
//        view.addSubview(allTableView)
//
        followersTableView.delegate = self
        followersTableView.dataSource = self

        mutualTableView.delegate = self
        mutualTableView.dataSource = self

        followingTableView.dataSource = self
        followingTableView.delegate = self

        suggestionTableView.delegate = self
        suggestionTableView.dataSource = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(FollowingButtonCollectionViewCell.nib(), forCellWithReuseIdentifier: FollowingButtonCollectionViewCell.identifier)
        
        mutualTableView.register(MutualTableViewCell.nib(), forCellReuseIdentifier: MutualTableViewCell.identifier)
        followingTableView.register(MutualTableViewCell.nib(), forCellReuseIdentifier: MutualTableViewCell.identifier)
        followersTableView.register(MutualTableViewCell.nib(), forCellReuseIdentifier: MutualTableViewCell.identifier)
        suggestionTableView.register(OthersSuggestedTableViewCell.nib(), forCellReuseIdentifier: OthersSuggestedTableViewCell.identifier)
    }

}

extension FollowingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch tableView {
        case followersTableView:
            return 2
        case followingTableView:
            return 2
        case suggestionTableView:
            return 1
        case mutualTableView:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case followersTableView:
            return 5
        case followingTableView:
            return 6
        case suggestionTableView:
            return 90
        case mutualTableView:
            return 8
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case suggestionTableView:
            let cell = suggestionTableView.dequeueReusableCell(withIdentifier: OthersSuggestedTableViewCell.identifier, for: indexPath) as! OthersSuggestedTableViewCell
            //cell.cellDelegate = self
            
            cell.removeButton.tag = indexPath.row
            print("\(cell.removeButton.tag)")
            cell.removeButton.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
            print("\(indexPath.row)")
            return cell
        case followersTableView:
            let cell = mutualTableView.dequeueReusableCell(withIdentifier: MutualTableViewCell.identifier, for: indexPath) as! MutualTableViewCell
            cell.delegate = self
            return cell
        case followingTableView:
            let cell = mutualTableView.dequeueReusableCell(withIdentifier: MutualTableViewCell.identifier, for: indexPath) as! MutualTableViewCell
            cell.delegate = self
            return cell
        case mutualTableView:
            let cell = mutualTableView.dequeueReusableCell(withIdentifier: MutualTableViewCell.identifier, for: indexPath) as! MutualTableViewCell
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch tableView {
            case followersTableView:
                followersTableHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
                let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
                followersTableView.addSubview(searchBar)
                return followersTableHeader
            case followingTableView:
                followingTableHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
                let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
                followingTableView.addSubview(searchBar)
                return followingTableHeader
            case mutualTableView:
                mutualTableHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
                let header = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
                header.text = "Followed By"
                mutualTableView.addSubview(header)
                return mutualTableHeader
            default:
                return nil
        }
    }
    
    @objc func deleteCell( sender: UIButton){
        print("yes")
        suggestionTableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        suggestionTableView.reloadData()
    }
}

extension FollowingViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowingButtonCollectionViewCell.identifier, for: indexPath) as! FollowingButtonCollectionViewCell
        
        switch indexPath.row {
            case 0:
                cell.buttonLabel.text = "Mutual"
                cell.buttonLabel.tintColor = .gray
            case 1:
                cell.buttonLabel.text = "Followers"
            cell.buttonLabel.tintColor = .gray
            case 2:
                cell.buttonLabel.text = "Following"
                cell.buttonLabel.tintColor = .gray
            case 3:
                cell.buttonLabel.text = "Suggested"
                cell.buttonLabel.tintColor = .gray
            default:
                cell.buttonLabel.text = "none"
                cell.buttonLabel.tintColor = .gray
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("Mutual")
            
            self.mutualTableView.isHidden = false
            self.followingTableView.isHidden = true
            self.followersTableView.isHidden = true
            self.suggestionTableView.isHidden = true
            
            mutualTableView.frame = CGRect(x: 0,
                                           y: 130,
                                           width: self.view.frame.width,
                                           height: 637
            )
            self.view.addSubview(mutualTableView)
        
            
        case 1:
            print("Followers")
            
            self.mutualTableView.isHidden = true
            self.followingTableView.isHidden = true
            self.followersTableView.isHidden = false
            self.suggestionTableView.isHidden = true
            
            followersTableView.frame = CGRect(x: 0,
                                           y: 130,
                                           width: self.view.frame.width,
                                           height: 637
            )
            self.view.addSubview(followersTableView)
        case 2:
            print("Following")
            
            self.mutualTableView.isHidden = true
            self.followingTableView.isHidden = false
            self.followersTableView.isHidden = true
            self.suggestionTableView.isHidden = true
            
            followingTableView.frame = CGRect(x: 0,
                                           y: 130,
                                           width: self.view.frame.width,
                                           height: 637
            )
            self.view.addSubview(followingTableView)
            
        case 3:
            print("Suggestions")
            
            self.mutualTableView.isHidden = true
            self.followingTableView.isHidden = true
            self.followersTableView.isHidden = true
            self.suggestionTableView.isHidden = false
            
            suggestionTableView.frame = CGRect(x: 0,
                                           y: 130,
                                           width: self.view.frame.width,
                                           height: 637
            )
            self.view.addSubview(suggestionTableView)
            
        default:
            print("none")
        }
    }
    
    
    
}

extension FollowingViewController: MutualTableViewCellDelegate{
    func unfollowButtonMethod(button: UIButton) {
        let ac = UIAlertController(title: nil ,
                                   message: "If you change your mind, you'll have to request to follow User again.",
                                   preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Unfollow", style: .default, handler: unfollowTapped(sender: )))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
        if buttonTrack {
            button.backgroundColor = .tintColor
            button.setTitleColor(UIColor.white, for: .normal)
            button.setTitle("Follow", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            buttonTrack = false
        }
    }
    
    func unfollowTapped(sender: UIAlertAction) {
        buttonTrack = true
    }
    
    func followButtonMethod(button: UIButton) {
        
        if !buttonTrack {
            button.backgroundColor = .lightGray
            button.setTitle("Following", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            buttonTrack = true
        }
    }
    
}

//MARK: Other SUggested Cell delegate and extension

//extension FollowingViewController: OthersSuggestedTableViewCellDelegate{
//
//    func removeCellFromTableMethod() {
//        print("cell tapped")
//
//    }
//}
