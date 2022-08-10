//
//  ListOfFollowersViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit

class ListOfFollowersViewModel{
    
    var userFollowingInformation: UserFollowingInformation!
    var followingUserDetails = [FollowingUserDetails]()
    
    var userFollowersInformation: UserFollowersInformation!
    var followersUserDetails = [FollowerUserDetails]()
    
    
    var mainButtonView = UIView()
    
    var followingButton = UIButton()
    var followersButton = UIButton()
    
    var followersTableView = UITableView()
    var followingTableView = UITableView()
    
    var header1 = UIView()
    var followersSearchBar = UISearchBar()
    
    var header2 = UIView()
    var header3 = UIView()
    
    func extractDataFromJson<T: Decodable>(fileName: String, dataType: T.Type) -> T?{
        var jsonData: Data!
        do {
            if let path = Bundle.main.path(forResource: fileName, ofType: "json"){
                let fileURL = try URL(fileURLWithPath: path)
                jsonData = try Data(contentsOf: fileURL)
            }
        } catch {
            print("error \(error)")
        }
        let decoder = JSONDecoder()
        var parsedData: T
        do{
            parsedData = try! decoder.decode(T.self, from: jsonData!)
            return parsedData
        } catch{
            print("error\(error)")
        }
        return nil
    }
    
    func extractImageFromURL(imageURL: URL) -> UIImage? {
        do{
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    return image
                }
            }
        } catch {
            print("error \(error)")
        }
        return nil
    }
}
