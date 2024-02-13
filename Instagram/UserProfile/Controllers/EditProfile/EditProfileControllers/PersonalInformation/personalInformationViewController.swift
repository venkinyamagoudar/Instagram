//
//  personalInformationViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit



class personalInformationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var personalInformationViewModel = PersonalInformationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PersonalInformationTableViewCell.nib(), forCellReuseIdentifier: PersonalInformationTableViewCell.identifier)
        tableView.reloadData()
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
            cell.firstLabel!.text = "Email"
            cell.personalInformationTableCellViewModel.indexPath = indexPath
            cell.personalInformationTableCellViewModel.personalDelegate = self
            cell.textField!.text = personalInformationViewModel.personalDetails.email
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.identifier, for: indexPath) as! PersonalInformationTableViewCell
            cell.firstLabel!.text = "Phone"
            cell.personalInformationTableCellViewModel.indexPath = indexPath
            cell.personalInformationTableCellViewModel.personalDelegate = self
            cell.textField!.text = personalInformationViewModel.personalDetails.phone
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.identifier, for: indexPath) as! PersonalInformationTableViewCell
            cell.firstLabel!.text = "Gender"
            cell.personalInformationTableCellViewModel.indexPath = indexPath
            cell.personalInformationTableCellViewModel.personalDelegate = self
            cell.textField!.text = personalInformationViewModel.personalDetails.gender
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInformationTableViewCell.identifier, for: indexPath) as! PersonalInformationTableViewCell
            cell.firstLabel!.text = "Birthday"
            cell.personalInformationTableCellViewModel.indexPath = indexPath
            cell.personalInformationTableCellViewModel.personalDelegate = self
            cell.textField!.text = personalInformationViewModel.personalDetails.birthday
            return cell
        default:
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        return header
    }
}

extension personalInformationViewController: PersonalInformationTableViewCellDelegate{
    func assigninfTextField(textField: String,indexPath: IndexPath) {
        personalInformationViewModel.personalInformationDelegate?.assigningText(text: textField, indexPath: indexPath)
    }
}
