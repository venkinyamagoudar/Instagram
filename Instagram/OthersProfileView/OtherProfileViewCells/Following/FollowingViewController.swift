//
//  FollowingViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/15/22.
//

import UIKit

class FollowingViewController: UIViewController {

    var buttonView = UIView()
    var allTableView = UIView()
    
    var followTable = UITableView()
    var followingTable = UITableView()
    var suggestionTable = UITableView()
    var mutualTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Other User Name"

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buttonView = UIView(frame: CGRect(x: 0,
                                          y: 90,
                                          width: view.frame.width,
                                          height: 40
                                         )
        )
        buttonView.backgroundColor = .gray
        view.addSubview(buttonView)
        
        allTableView = UIView(frame: CGRect(x: 0,
                                            y: 130,
                                            width: 414,
                                            height: 635))
        allTableView.backgroundColor = .blue
        view.addSubview(allTableView)
        
        followTable.delegate = self
        followTable.dataSource = self
        
        mutualTable.delegate = self
        mutualTable.dataSource = self
        
        followingTable.dataSource = self
        followingTable.delegate = self
        
        suggestionTable.delegate = self
        suggestionTable.dataSource = self
        
        followButtonTapped()
        followingButtonTapped()
        suggestionButtonTapped()
        mutualButtonTapped()
        
    }
    
    func followButtonTapped() {
        
        
    }

    func followingButtonTapped() {
        
    }

    func suggestionButtonTapped() {
        
    }

    func mutualButtonTapped() {
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FollowingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case followTable:
            return 5
        case followingTable:
            return 6
        case suggestionTable:
            return 7
        case mutualTable:
            return 8
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case followTable:
            return UITableViewCell()
        case followingTable:
            return UITableViewCell()
        case suggestionTable:
            return UITableViewCell()
        case mutualTable:
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    
}
