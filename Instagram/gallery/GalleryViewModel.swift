//
//  GalleryViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit

class GalleryViewModel{
    
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
