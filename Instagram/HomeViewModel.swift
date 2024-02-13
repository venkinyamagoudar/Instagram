//
//  HomeViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation
import UIKit

class HomeViewModel{
    
    //Posts
    var userFollowingPosts: UserFollowingPosts!
    var postDetails = [UserFollowingPostsDetails]()
    var extractedImage: [UIImage]!
    
    //Story
    var userFollowingStories: UserFollowingStories!
 
    func readLocalJsonFile<T: Decodable>(fileName: String, dataType: T.Type) -> T?{
        let decoder = JSONDecoder()
        do {
            if let path = Bundle.main.path(forResource: fileName, ofType: "json"){
                let fileURL = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileURL)
                let parsedData = try decoder.decode(T.self, from: data)
                return parsedData
            }
        } catch {
            print("error \(error)")
        }
        return nil
    }
    
    func getImageData(imageURL: URL) -> UIImage?{
        do {
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    return image
                }
            }
        }catch{
            print("error in image \(error)")
        }
        return nil
    }
}
