//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/12/22.
//

import UIKit
protocol ProfileInfoHeaderCollectionReusableViewDelegate : AnyObject {
    func ProfileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapDiscoverPeopleButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func userInformationFunction(_ userInformation: UserInformation, headerProfileImage: UIImage, _ followersCount: FollowersCount,_ followingCount: FollowingCount,_ postCount: PostCount)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {

    static var identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegateProfile : ProfileInfoHeaderCollectionReusableViewDelegate?
    
    var userInformation : UserInformation!
    var followingCount : FollowingCount!
    var followersCount: FollowersCount!
    var postCount: PostCount!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var numberOfPosts: UIButton!
    @IBOutlet weak var numberOfFollowing: UIButton!
    @IBOutlet weak var numberOfFollowers: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileInfoHeaderCollectionReusableView", bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let headers = [
//            "X-RapidAPI-Key": "4146e22360msh54b767a3c398b2fp1d4ea3jsn9e7cd3101918",
//            "X-RapidAPI-Host": "instagram-data1.p.rapidapi.com"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://instagram-data1.p.rapidapi.com/user/info?username=venki_nyamagoudar")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print("error")
//            } else {
//                let httpResponse = response as? HTTPURLResponse
////                print(httpResponse)
//                let decoder = JSONDecoder()
//                var userData: UserInformation!
//                do {
//                    userData = try decoder.decode(UserInformation.self, from: data!)
//                } catch {
//                    print("Error while decoding Json file into SWIFT structure: \(error)")
//                }
//                self.userInformation = userData
//                self.followingCount = self.userInformation.edge_follow
//                self.followersCount = self.userInformation.edge_followed_by
//                self.postCount = self.userInformation.edge_owner_to_timeline_media
//                
//                if let imageData = try? Data(contentsOf: self.userInformation.profile_pic_url_hd) {
//                    if let loadedImage = UIImage(data: imageData){
//                        DispatchQueue.main.async { [self] in
//                            self.profileImage.image = loadedImage
//                            self.userName.text = self.userInformation.username
//                            self.numberOfFollowers.setTitle(String(self.followersCount.count), for: .normal)
//                            self.numberOfFollowing.setTitle(String(self.followingCount.count), for: .normal)
//                            self.numberOfPosts.setTitle(String(self.postCount.count), for: .normal)
//                        }
//                    }
//                }
//            }
//        })
//        dataTask.resume()
        
        
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
        profileImage.layer.borderWidth = 1.0
    }
    
    
    @IBAction func numberOfPosts(_ sender: Any) {
       delegateProfile?.ProfileHeaderDidTapPostButton(self)
    }
    
    @IBAction func numberofFollowing(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapFollowingButton(self)
    }
    
    @IBAction func numberOfFollowers(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapFollowersButton(self)
    }
    
    @IBAction func editProfileBUtton(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapEditProfileButton(self)
    }
    
    @IBAction func discoverPeopleButton(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapDiscoverPeopleButton(self)
    }
    
}
