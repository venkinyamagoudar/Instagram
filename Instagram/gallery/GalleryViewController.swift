//
//  CameraViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/29/22.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = self.createLayout()
        
    }
    
    //Collection view cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .red
        } else  {
            cell.backgroundColor = .blue
        }
        
        return cell
    }
    
    // custom layout
    func createLayout() -> UICollectionViewCompositionalLayout {
        //item
        let item = NSCollectionLayoutItem(layoutSize:
                                            NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1),
                                                heightDimension: .fractionalHeight(1)
                                            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                     leading: 2,
                                                     bottom: 2,
                                                     trailing: 2
        )

        //group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(2/5)
                                              ),
            subitem: item,
            count: 3)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
