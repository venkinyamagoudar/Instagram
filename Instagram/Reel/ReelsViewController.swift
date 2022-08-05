//
//  ReelsViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/30/22.
//

import UIKit
import AVFoundation

class ReelsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    var reelsData: Reels!
    var reelCreators = [ReelCreator]()

    
    @IBOutlet weak var collectionView: UICollectionView!
    var player: AVPlayer?
    var avPlayerLayer: AVPlayerLayer?
    
    @IBOutlet weak var displayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
        
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
        catch {
            print(error)
        }
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
        
        let videoURL = reelCreators[indexPath.row].url
        player = AVPlayer(url: videoURL)
        player?.isMuted = false
        avPlayerLayer = AVPlayerLayer(player: player)

        avPlayerLayer?.frame = cell.reelView.frame
        avPlayerLayer?.videoGravity = .resizeAspectFill
        avPlayerLayer?.zPosition = -1
        cell.reelView.layer.addSublayer(avPlayerLayer!)

        cell.avPlayerLayer = avPlayerLayer
        cell.player = player
//
        cell.configure(model: reelCreators[indexPath.row])
//
        cell.reelsCellDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? ReelsCollectionViewCell)?.player!.play()
        
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: .main) { [weak self] _ in
                self?.player?.seek(to: CMTime.zero)
                self?.player?.play()
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? ReelsCollectionViewCell)?.player!.pause()
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
