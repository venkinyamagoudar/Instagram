//
//  MessageTableViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/24/22.
//

import UIKit
import CoreMedia

class MessageTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MessageTableViewCell.nib(), forCellReuseIdentifier: MessageTableViewCell.identifier)
    }

    // table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageTableViewCell
        cell.messageTableCellViewModel.cameraDelegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MessageTableViewController : MessageTableViewCellDelegate {
    func didTapCameraButton() {
        let vc = CameraViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
