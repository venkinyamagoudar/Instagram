//
//  ShopCartViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/5/22.
//

import UIKit

class ShopCartViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CartTableViewCell.nib(), forCellReuseIdentifier: CartTableViewCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250)
    }
    
}
