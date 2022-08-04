//
//  SearchSelectionViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/1/22.
//

import UIKit

class SearchSelectionViewController: UIViewController{
    
    
    var tableView: UITableView!
    var userSearchDetails = [UserSearchDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(SearchSelectionTableViewCell.nib(), forCellReuseIdentifier: SearchSelectionTableViewCell.identifier)
        
    }
    
    func configure(model: [UserSearchDetails]){
//        print(model)
        self.userSearchDetails = model
        if userSearchDetails.count > 0 {
            for user in self.userSearchDetails{
                let vc = SearchSelectionTableViewCell()
                vc.configure(username: user.username, fullName: user.full_name, profileImage: extractImagefromURL(imageURL: user.profile_pic_url)!)
//                self.tableView.reloadData()
            }
        }
    }
    
    func extractImagefromURL(imageURL: URL) -> UIImage? {
        do{
            if let imageData = try? Data(contentsOf: imageURL){
                let image = UIImage(data: imageData)
                return image
            }
        } catch {
            print("error at image  \(error)")
        }
        return nil
    }
}

extension SearchSelectionViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSelectionTableViewCell.identifier, for: indexPath) as! SearchSelectionTableViewCell
//        if userSearchDetails.count > 0 {
//            //cell.configure(model: userSearchDetails[indexPath.row])
//            cell.searchFullName.text = self.userSearchDetails[indexPath.row].full_name
//            cell.searchUsername.text = self.userSearchDetails[indexPath.row].username
//            cell.searchProfileView.image = extractImagefromURL(imageURL: self.userSearchDetails[indexPath.row].profile_pic_url)
//        }
        return cell
    }
}
