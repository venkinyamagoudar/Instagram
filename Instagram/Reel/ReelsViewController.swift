//
//  ReelsViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/30/22.
//

import UIKit
import AVFoundation

class ReelsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var displayView: UIView!
    
    private let reelViewModel = ReelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .blue
        
        collectionView.register(ReelsCollectionViewCell.nib(), forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //MARK: reel data
        let vc = HomeViewModel()
        guard let parsedReelsData = vc.readLocalJsonFile(fileName: "Reels", dataType: Reels.self) else {return}
        self.reelViewModel.reelsData = parsedReelsData
        self.reelViewModel.reelCreators = parsedReelsData.reelCreators
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    //collectrion view
    
    /// Description: - collection view
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - section: <#section description#>
    /// - Returns: <#description#>
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reelViewModel.reelCreators.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as! ReelsCollectionViewCell
        
        let videoURL = reelViewModel.reelCreators[indexPath.row].url
        reelViewModel.avPlayerLayer?.frame = cell.reelView.frame
        (cell.reelCollectionViewModel.player,cell.reelCollectionViewModel.avPlayerLayer) = reelViewModel.createPlayer(videoURL)
        cell.reelView.layer.addSublayer(reelViewModel.avPlayerLayer!)
        cell.configure(model: reelViewModel.reelCreators[indexPath.row])
        cell.reelCollectionViewModel.reelsCellDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? ReelsCollectionViewCell)?.reelCollectionViewModel.player!.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.reelViewModel.player?.currentItem, queue: .main) { [weak self] _ in
            self?.reelViewModel.player?.seek(to: CMTime.zero)
            self?.reelViewModel.player?.play()
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? ReelsCollectionViewCell)?.reelCollectionViewModel.player!.pause()
    }
    
}

extension ReelsViewController : ReelsCollectionViewCellDelegate {
    func didTapMoreButton() {
        let ac = UIAlertController(title: "More Options", message: "", preferredStyle: .actionSheet)
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
        print("Comments")
    }
}
