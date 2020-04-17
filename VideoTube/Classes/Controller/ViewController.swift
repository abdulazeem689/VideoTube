//
//  ViewController.swift
//  VideoTube
//
//  Created by Abdul Azeem on 11/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var popularVideos = [Item]()
    var channelData = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.getMostPopularVideos { (popularVideosArr) in
            self.popularVideos = popularVideosArr
            self.collectionView.reloadData()
        }
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.popularVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCellID", for: indexPath) as! VideoCVCell
        cell.setContent(popularVideos: self.popularVideos, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 285)
    }
}

