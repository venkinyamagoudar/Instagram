//
//  ChatViewController.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/13/22.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let videoCall = UIBarButtonItem(image: UIImage(systemName: "video.fill"), style: .done, target: self, action: #selector(videoCallButton))
        let audioCall = UIBarButtonItem(image: UIImage(systemName: "phone"), style: .done, target: self, action: #selector(audioCallButton))
        navigationItem.rightBarButtonItems = [videoCall, audioCall]
        self.title = "Chat Section"
    }

    @objc func videoCallButton() {
        print("Audio Call")
    }
    
    @objc func audioCallButton() {
        print("Video Call")
    }
}
