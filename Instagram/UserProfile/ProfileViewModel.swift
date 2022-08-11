//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation
import UIKit

class ProfileViewModel{
    
    var userInformationProfile : UserInformation!
    var followingCountProfile : FollowingCount!
    var followersCountProfile: FollowersCount!
    var postCountProfile: PostCount!
    var profileImage: UIImage!
    
    var userPosts: UserPosts!
    var postDetails = [PostDetails]()
    
    func extractDatafromJsonFile<T: Decodable>(fileName:String, dataType: T.Type) -> T? {
        var jsonData: Data!
        do{
            if let path = Bundle.main.path(forResource: fileName, ofType: "json"){
                let fileURL = URL(fileURLWithPath: path)
                jsonData = try Data(contentsOf: fileURL)
            }
        } catch {
            print("error while parsing\(error)")
        }
        let decoder = JSONDecoder()
        var parsedData : T!
        do {
            parsedData = try? decoder.decode(T.self, from: jsonData!)
            return parsedData
        } catch {
            print("error wjile parsing \(error)")
        }
        return nil
    }
    
    func extractImageFromURL(imageUrl: URL) -> UIImage?{
        do {
            if let imageData = try? Data(contentsOf: imageUrl){
                if let image = UIImage(data: imageData){
                    return image
                }
            }
        } catch{
            print("erroe while ectraing image \(error)")
        }
        return nil
    }
}
