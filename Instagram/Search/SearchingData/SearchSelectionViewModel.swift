//
//  SearchSelectionViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/8/22.
//

import Foundation
import UIKit

class SearchSelectionViewModel {
    
    var userSearchDetails = [UserSearchDetails]()
    var tableView: UITableView!
    
    func extractImagefromURL(imageURL: URL) -> UIImage? {
        do{
            if let imageData = try? Data(contentsOf: imageURL){
                let image = UIImage(data: imageData)
                return image
            }
        } catch {
            print("error at image  \(error)")
        }
        return nil
    }
    
    
}
