//
//  DataManager.swift
//  VideoTube
//
//  Created by Abdul Azeem on 14/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

class DataManager {
    
    class func getMostPopularVideos(completion: @escaping ([Item])->()){
        let urlString = "https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&regionCode=IN&key=AIzaSyB1dstyQMMEfg9U-7d8Tfn_n-8lInZQ4aI"
        guard let url = URL(string: urlString) else{return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{return}
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(VideoStruct.self, from: data)
                DispatchQueue.main.async {
                    completion(response.items ?? [])
                }
            }catch{
                print(error)
            }
        }.resume()
    }
    
    class func getChannelData(channelId: String, completion: @escaping ([Item])->()){
        let urlString = "https://www.googleapis.com/youtube/v3/channels?part=snippet&id="+channelId+"&key=AIzaSyB1dstyQMMEfg9U-7d8Tfn_n-8lInZQ4aI"
        guard let url = URL(string: urlString) else{return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data , error == nil else{return}
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(ChannelStruct.self, from: data)
                DispatchQueue.main.async {
                    completion(response.items ?? [])
                }
            }catch{
                print(error)
            }
        }.resume()
    }
}
