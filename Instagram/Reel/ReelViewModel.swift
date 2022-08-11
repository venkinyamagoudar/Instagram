//
//  ReelViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import AVFoundation


class ReelViewModel {
    var reelsData: Reels!
    var reelCreators = [ReelCreator]()
    
    var player: AVPlayer?
    var avPlayerLayer: AVPlayerLayer?
    
    
    /// Description - create video Player funcnction
    /// - Parameter videoURL: URL for the video
    /// - Returns: player and AVPLayer layer
    func createPlayer(_ videoURL: URL) -> (AVPlayer?, AVPlayerLayer?){
        self.player = AVPlayer(url: videoURL)
        self.player?.isMuted = false
        self.avPlayerLayer = AVPlayerLayer(player: player)
        
        self.avPlayerLayer?.videoGravity = .resizeAspectFill
        self.avPlayerLayer?.zPosition = -1
        return (self.player, self.avPlayerLayer)
    }
}
