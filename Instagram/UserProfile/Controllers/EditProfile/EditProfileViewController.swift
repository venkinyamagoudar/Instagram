//
//  EditViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/12/22.
//

import UIKit

class EditProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var imageView: UIImageView!
    var changeProfilePhotoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "Edit profile"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButton))
        
        self.tableView.register(EditProfileTableViewCell.nib(), forCellReuseIdentifier: EditProfileTableViewCell.identifier)
        self.tableView.register(EditWebsiteTableViewCell.nib(), forCellReuseIdentifier: EditWebsiteTableViewCell.identifier)
        self.tableView.register(EditProfileOtherTableViewCell.nib(), forCellReuseIdentifier: EditProfileOtherTableViewCell.identifier)
    }

    //MARK: - Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileTableViewCell.identifier, for: indexPath) as! EditProfileTableViewCell
            cell.firstLabel.text = "Name"
//            cell.secondLabel.isUserInteractionEnabled = true
//            let tap = UITapGestureRecognizer(target: self, action: #selector(chanegeNameMethod(tapGestureRecognizer:)))
//            cell.secondLabel.addGestureRecognizer(tap)
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileTableViewCell.identifier, for: indexPath) as! EditProfileTableViewCell
            cell.firstLabel.text = "Username"
//            cell.secondLabel.isUserInteractionEnabled = true
//            let tap = UITapGestureRecognizer(target: self, action: #selector(chanegeUsernameMethod(tapGestureRecognizer:)))
//            cell.secondLabel.addGestureRecognizer(tap)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileTableViewCell.identifier, for: indexPath) as! EditProfileTableViewCell
            cell.firstLabel.text = "Pronouns"
//            cell.secondLabel.isUserInteractionEnabled = true
//            let tap = UITapGestureRecognizer(target: self, action: #selector(chanegePronounsMethod(tapGestureRecognizer:)))
//            cell.secondLabel.addGestureRecognizer(tap)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: EditWebsiteTableViewCell.identifier, for: indexPath) as! EditWebsiteTableViewCell
            cell.firstLabel.text = "Website"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileTableViewCell.identifier, for: indexPath) as! EditProfileTableViewCell
            cell.firstLabel.text = "Bio"
//            cell.secondLabel.isUserInteractionEnabled = true
//            let tap = UITapGestureRecognizer(target: self, action: #selector(chanegeBioMethod(tapGestureRecognizer:)))
//            cell.secondLabel.addGestureRecognizer(tap)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileOtherTableViewCell.identifier, for: indexPath) as! EditProfileOtherTableViewCell
            cell.firstLabel.text = "Switch to professional Account"
            cell.firstLabel.textColor = .tintColor
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileOtherTableViewCell.identifier, for: indexPath) as! EditProfileOtherTableViewCell
            cell.firstLabel.text = "Create avatar"
            cell.firstLabel.textColor = .tintColor
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileOtherTableViewCell.identifier, for: indexPath) as! EditProfileOtherTableViewCell
            cell.firstLabel.text = "Personal information settings"
            cell.firstLabel.textColor = .tintColor
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row
        {
        case 0:
            let vc = EditProfileNameViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = EditProfileUsernameViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = EditProfilePronounsViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = EditProfileBioViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = ProfessionalAccountViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = AvatarViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = personalInformationViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("do nothing")
            
        }
        
    }
    
    //MARK: Table Header
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(120)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 100))
        headerView.backgroundColor = .white
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        imageView.backgroundColor = .orange
        imageView.center = CGPoint(x: headerView.frame.width / 2, y:  headerView.frame.height / 2)
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = imageView.frame.width / 2
        headerView.addSubview(imageView)
        
        changeProfilePhotoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 17))
        changeProfilePhotoLabel.text = "Change profile photo"
        changeProfilePhotoLabel.center = CGPoint(x: headerView.frame.width / 2, y: 107.5)
        changeProfilePhotoLabel.textAlignment = .center
        changeProfilePhotoLabel.font = changeProfilePhotoLabel.font.withSize(12)
        headerView.addSubview(changeProfilePhotoLabel)
        
        imageView.isUserInteractionEnabled = true
        changeProfilePhotoLabel.isUserInteractionEnabled = true
        
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(changeProfilePhoto(tapGestureRecognizer:)))
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(changeProfilePhoto(tapGestureRecognizer:)))
        imageView.addGestureRecognizer(tapImage)
        changeProfilePhotoLabel.addGestureRecognizer(tapRecogniser)
        
        return headerView
    }
    
    
    @objc func changeProfilePhoto(tapGestureRecognizer: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Remove current photo", style: .default, handler: removeCurrentPhotoMethod))
        alertController.addAction(UIAlertAction(title: "Import from Facebook", style: .default, handler: importFromFacebookMethod))
        alertController.addAction(UIAlertAction(title: "Take photo", style: .default, handler: takePhotoMethod))
        alertController.addAction(UIAlertAction(title: "Choose from library", style: .default, handler: chooseFromLibraryMethod))
        alertController.addAction(UIAlertAction(title: "Use avatar", style: .default, handler: useAvatarMethod))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true)
    }
    
    func removeCurrentPhotoMethod(sender: UIAlertAction) {
        imageView.image = UIImage(named: "")
    }
    
    func importFromFacebookMethod(sender: UIAlertAction) {
        print("facebook tapped")
    }
    
    func takePhotoMethod(sender: UIAlertAction) {
        let vc = CameraViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func chooseFromLibraryMethod(sender: UIAlertAction) {
        let galleryViewController = self.storyboard!.instantiateViewController(withIdentifier: "GalleryViewController")
        self.navigationController!.pushViewController(galleryViewController, animated: true)
    }
    
    func useAvatarMethod(sender: UIAlertAction) {
        print("get avatar")
    }
    
    
    //MARK: - selectors
    
    @objc func doneButton() {
        print("SAve all the changes")
    }
    
    // MARK: Edit Profile Labels methods
//
//    @objc func chanegeNameMethod(tapGestureRecognizer: UITapGestureRecognizer) {
//        let vc = CameraViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @objc func chanegeUsernameMethod(tapGestureRecognizer: UITapGestureRecognizer) {
//        let vc = CameraViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @objc func chanegePronounsMethod(tapGestureRecognizer: UITapGestureRecognizer) {
//        let vc = CameraViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @objc func chanegeWebsiteMethod(tapGestureRecognizer: UITapGestureRecognizer) {
//        let vc = CameraViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @objc func chanegeBioMethod(tapGestureRecognizer: UITapGestureRecognizer) {
//        let vc = CameraViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
}
