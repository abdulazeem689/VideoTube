//
//  YTPlayerVC.swift
//  VideoTube
//
//  Created by Abdul Azeem on 23/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class YTPlayerVC: UIViewController {

    @IBOutlet var playerView: WKYTPlayerView!
    var videoId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerView.load(withVideoId: self.videoId ?? "kDUqOcvUVIQ")
    }

}
