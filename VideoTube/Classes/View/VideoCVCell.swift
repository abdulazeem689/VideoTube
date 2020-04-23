//
//  VideoCVCell.swift
//  VideoTube
//
//  Created by Abdul Azeem on 14/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class VideoCVCell: UICollectionViewCell {
    
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var channelTitle: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var channelIcon: UIImageView!
    var channelId: String?
    var views: String?
    
    
    
    func setContent(popularVideos: [Item], indexPath: IndexPath){
        self.title.text = popularVideos[indexPath.row].snippet?.title
        self.duration.text = HelpingMethods.duration(duration: (popularVideos[indexPath.row].contentDetails?.duration)!)
        ImageServices().getImage(urlString: (popularVideos[indexPath.row].snippet?.thumbnails?.high?.url)!) { (image) in
            self.thumbnail.image = image
        }
        self.channelId = popularVideos[indexPath.row].snippet?.channelId
        self.views = popularVideos[indexPath.row].statistics?.viewCount
        DataManager.getChannelData(channelId: self.channelId ?? "UCm9SZAl03Rev9sFwloCdz1g") { (channelData) in
            self.channelTitle.text = "\((channelData[0].snippet?.title)!) . \(HelpingMethods.views(views: Int(self.views!)!)) views . \(HelpingMethods.publishedAt(publishedAt: (popularVideos[indexPath.row].snippet?.publishedAt)!))"
            ImageServices().getImage(urlString: (channelData[0].snippet?.thumbnails?.high?.url)!) { (image) in
                self.channelIcon.image = image
            }
        }
    }
}
