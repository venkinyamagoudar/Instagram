//
//  SearchSelectionViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/1/22.
//

import UIKit

class SearchSelectionViewController: UIViewController{
    
    
    // read dependency injection
    // You should not create objects inside viewController
    var viewModel: SearchSelectionViewModel! = SearchSelectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
            viewModel.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(viewModel.tableView)
        
        viewModel.tableView.delegate = self
        viewModel.tableView.dataSource = self
        
        self.viewModel.tableView.register(SearchSelectionTableViewCell.nib(), forCellReuseIdentifier: SearchSelectionTableViewCell.identifier)
        
    }
    
    func configure(model: [UserSearchDetails]){
        self.viewModel.userSearchDetails = model
        viewModel.tableView.reloadData()
    }
}

extension SearchSelectionViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userSearchDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSelectionTableViewCell.identifier, for: indexPath) as! SearchSelectionTableViewCell
        if viewModel.userSearchDetails.count > 0 {
            cell.configure(username: self.viewModel.userSearchDetails[indexPath.row].username, fullName: self.viewModel.userSearchDetails[indexPath.row].full_name, profileImage: self.viewModel.userSearchDetails[indexPath.row].profile_pic_url)
            cell.searchFullName.text = self.viewModel.userSearchDetails[indexPath.row].full_name
            cell.searchUsername.text = self.viewModel.userSearchDetails[indexPath.row].username
            cell.searchProfileView.image = viewModel.extractImagefromURL(imageURL: self.viewModel.userSearchDetails[indexPath.row].profile_pic_url)
        }
        return cell
    }
}
