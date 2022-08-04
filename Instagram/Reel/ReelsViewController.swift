//
//  ReelsViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/30/22.
//

import UIKit
import AVFoundation

class ReelsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var collectionView: UICollectionView!
    var reelsData: Reels!
    var reelCreators = [ReelCreator]()
    
    @IBOutlet weak var displayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithTransparentBackground()
//        navigationController?.navigationBar.standardAppearance = appearance
        
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width
                                 , height: self.displayView.frame.height - 40)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = CGFloat(1)
        layout.minimumLineSpacing = CGFloat(1)
        
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
        
        displayView.addSubview(collectionView)
        collectionView.register(ReelsCollectionViewCell.nib(), forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //MARK: reel data
        let vc = ViewController()
        guard let jsonData = vc.readLocalJsonFile(fileName: "Reels") else {return}
        let decoder = JSONDecoder()
        var parsedReelsData: Reels!
        do {
            parsedReelsData = try? decoder.decode(Reels.self, from: jsonData)
        }
//        catch {
//            print(error)
//        }
        self.reelsData = parsedReelsData
        self.reelCreators = parsedReelsData.reelCreators
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    //collectrion view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reelCreators.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as! ReelsCollectionViewCell
        cell.configure(model: reelCreators[indexPath.row])
        cell.playVideo()
        cell.reelsCellDelegate = self
        return cell
    }
    
   
    
    //cell size
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 414, height: 750 )
//    }
    
    // CAMERA button
    
    @IBAction func didTapCamera(_ sender: Any) {
        let vc = CameraViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let visibleCells = self.collectionView.indexPathsForVisibleItems.sorted{top, bottom -> Bool in
//            return top.section < bottom.section || top.row < bottom.row
//        }.compactMap{indexPath -> UICollectionViewCell? in
//            return self.collectionView.cellForItem(at: indexPath)}
//        let indexpaths = self.collectionView.indexPathsForVisibleItems.sorted()
//
//    }
    
}

extension ReelsViewController : ReelsCollectionViewCellDelegate {
    func didTapMoreButton() {
        let ac = UIAlertController(title: "More OPtions", message: "", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Share", style: .default, handler: shareButtonTapped))
        ac.addAction(UIAlertAction(title: "Save", style: .default, handler: saveButtonTapped))
        present(ac, animated: true)
    }
    
    func shareButtonTapped(_ action:UIAlertAction){
        print("sharing To")
        
    }
    
    func saveButtonTapped(actio: UIAlertAction){
        print("Saved")
    }
    
    func didTapForwardButton() {
        let vc = MessageTableViewController()
        present(vc, animated: true)
    }
    
    func didTapCommentButton() {
//        let vc = CommentViewController()
//        present(vc)
        print("Comments")
    }
    
    
}
