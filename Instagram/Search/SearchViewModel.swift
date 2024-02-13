//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import Foundation

class SearchViewModel {
        
    var userSearch: UserSearch!
    var userSearchDetails = [UserSearchDetails]()
    
    lazy var searchSelectionViewController: SearchSelectionViewController = {
        SearchSelectionViewController()
    }()
    
    //MARK: data extraction
    func extractDataFromJsonFile<T : Decodable>(filename: String, dataType: T.Type) -> T?{
    
        let decoder = JSONDecoder()
        var searchData: T!
        do{
            if let path = try Bundle.main.path(forResource: filename, ofType: "json"){
                let pathURL = try URL(fileURLWithPath: path)
                let jsonData = try Data(contentsOf: pathURL)
                searchData = try decoder.decode(T.self, from: jsonData)
                return searchData
            }
        } catch {
            print("error  \(error)")
        }
        return nil
    }
}
