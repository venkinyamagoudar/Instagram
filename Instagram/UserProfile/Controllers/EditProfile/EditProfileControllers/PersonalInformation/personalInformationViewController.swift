//
//  personalInformationViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class personalInformationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var personalInformation: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PersonalInformationTableViewCell.nib(), forCellReuseIdentifier: PersonalInformationTableViewCell.identifier)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        print("save button")
    }
    
}

extension personalInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.identifier, for: indexPath) as! PersonalInformationTableViewCell
            cell.firstLabel.text = "Email"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.identifier, for: indexPath) as! PersonalInformationTableViewCell
            cell.firstLabel.text = "Phone"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.identifier, for: indexPath) as! PersonalInformationTableViewCell
            cell.firstLabel.text = "Gender"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.identifier, for: indexPath) as! PersonalInformationTableViewCell
            cell.firstLabel.text = "Birthday"
            return cell
        default:
            return UITableViewCell()
            
        }
    }
    
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//        switch indexPath!.row {
//        case 0:
//            personalInformation.email
//        case 1:
//
//        case 2:
//
//        case 3:
//
//        default:
//
//
//        }
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        return header
    }
}
