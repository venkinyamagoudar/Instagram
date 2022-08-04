//
//  SearchViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/30/22.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    var userSearch: UserSearch!
    var userSearchDetails = [UserSearchDetails]()
    
    let searchController = UISearchController(searchResultsController: SearchSelectionViewController())
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        collectionView.register(SearchCollectionViewCell.nib(), forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        //layout
        collectionView.collectionViewLayout = self.createLayout()
        
        
        //MARK: Search Controller
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        //MARK: JSON READING
        let jsonData = extractDataFromJsonFile(filename: "UserSearch")
        let decoder = JSONDecoder()
        
        var searchData: UserSearch!
        do{
            searchData = try decoder.decode(UserSearch.self, from: jsonData!)
        }catch{
            print(error)
        }
        self.userSearch = searchData
        userSearchDetails = userSearch.data
    }
    
    //MARK: data extraction
    
    func extractDataFromJsonFile(filename: String) -> Data?{
        do{
            if let path = try Bundle.main.path(forResource: filename, ofType: "json"){
                let pathURL = try URL(fileURLWithPath: path)
                let jsonData = try Data(contentsOf: pathURL)
                return jsonData
            }
        } catch {
            print("error  \(error)")
        }
        return nil
    }
    
    //Collection view delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //layout function
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        //items
        //1st row
        let leadingItem = NSCollectionLayoutItem(
            layoutSize:NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
                )
        )
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                            leading: 2,
                                                            bottom: 2,
                                                            trailing: 2)
        let leadingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)),
            subitems: [leadingItem])
        
        
        //2nd row
        let middleItem = NSCollectionLayoutItem(
            layoutSize:NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
                )
        )
        middleItem.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                           leading: 2,
                                                           bottom: 2,
                                                           trailing: 2)
        let middleGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)),
            subitems: [middleItem])

        // 3rd row
        
        let trailingItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
        
        //Container group
        let containerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)),
            subitems: [leadingGroup,middleGroup, trailingItem])
        
        //section
        let section = NSCollectionLayoutSection(group: containerGroup)
        
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //when cell is tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell tapped")
    }
}


extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        var matchedUsers = [UserSearchDetails]()
        for user in userSearchDetails{
            if user.full_name.contains(text) || user.username.contains(text) {
                matchedUsers.append(user)
            }
        }
        let vc = SearchSelectionViewController()
        vc.configure(model: matchedUsers)
        
        
    }
}
