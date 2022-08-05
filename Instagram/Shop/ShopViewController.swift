//
//  ShopViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/30/22.
//

import UIKit

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ShoppingCollectionViewCell.nib(), forCellWithReuseIdentifier: ShoppingCollectionViewCell.identifier)
        
        collectionView.collectionViewLayout = self.collectionLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // searchbar delegate
        searchBar.delegate = self
        
        //bar button
        let accountButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(accountTapped))
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        let bellButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(bellTapped))
        self.navigationItem.rightBarButtonItems = [accountButton,cartButton,bellButton]
    }
    
    //collection view datasourse
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShoppingCollectionViewCell
        return cell
    }
    
//    collection view layout
    func collectionLayout() -> UICollectionViewCompositionalLayout {
        // item
        
        let item = NSCollectionLayoutItem(layoutSize:
                                    NSCollectionLayoutSize(
                                        widthDimension: .fractionalWidth(1/2),
                                        heightDimension: .fractionalHeight(1)
                                    )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        // group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize:  NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)),
            subitems: [item]
        )
        // section
        let section = NSCollectionLayoutSection(group: group)
        // retutn
        return UICollectionViewCompositionalLayout(section: section)
    }
    
   
    @IBAction func cameraButton(_ sender: Any) {
        print("camera tapped")
        let vc = CameraViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
// bar buttons accout button
    @objc func accountTapped() {
        let alertController = UIAlertController(title: "Your Account", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Wishlist", style: .default, handler: wishList))
        alertController.addAction(UIAlertAction(title: "Orders", style: .default,handler: orders))
        alertController.addAction(UIAlertAction(title: "Payment Settings", style: .default,handler: paymentSettings))
        alertController.addAction(UIAlertAction(title: "your Rewards", style: .default,handler: yourRewards))
        alertController.addAction(UIAlertAction(title: "Shops", style: .default,handler: shops))
        alertController.addAction(UIAlertAction(title: "Offer & Sales", style: .default,handler: offerAndSales))
        alertController.addAction(UIAlertAction(title: "Drops", style: .default,handler: drops))
        alertController.addAction(UIAlertAction(title: "Live", style: .default,handler: live))
        alertController.addAction(UIAlertAction(title: "Editors' Pick", style: .default,handler: editorsPick))
        alertController.addAction(UIAlertAction(title: "Buy On Instagram", style: .default,handler: buyOnInstagram))
        present(alertController, animated: true)
    }
    
    func wishList(action: UIAlertAction){
        
    }
    
    func orders(action: UIAlertAction){
        
    }
    
    func paymentSettings(action: UIAlertAction){
        
    }
    
    func yourRewards(action: UIAlertAction){
        
    }
    
    func shops(action: UIAlertAction){
        
    }
    
    func offerAndSales(action: UIAlertAction){
        
    }
    
    func drops(action: UIAlertAction){
        
    }
    
    func live(action: UIAlertAction){
        
    }
    
    func editorsPick(action: UIAlertAction){
        
    }
    
    func buyOnInstagram(action: UIAlertAction){
        
    }
    
    
//    Cart Button
    @objc func cartTapped() {
        
        let viewController = ShopCartViewController()
        self.navigationController!.pushViewController(viewController, animated: true)
        
    }
    
    @objc func bellTapped() {
        let viewController = ShoppongActivityViewController()
        self.navigationController!.pushViewController(viewController, animated: true)
    }
}

extension ShopViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
