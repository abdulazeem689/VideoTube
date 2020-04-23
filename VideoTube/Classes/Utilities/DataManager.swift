//
//  DataManager.swift
//  VideoTube
//
//  Created by Abdul Azeem on 14/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

class DataManager {
    
    class func getMostPopularVideos(completion: @escaping ([Item])->Void){
        let endpoint = "videos?part=snippet,contentDetails,statistics&chart=mostPopular&regionCode=IN&key=AIzaSyB1dstyQMMEfg9U-7d8Tfn_n-8lInZQ4aI"
        Webservice.callApi(endpoint: endpoint) { (data) in
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(VideoStruct.self, from: data)
                DispatchQueue.main.async {
                    completion(response.items ?? [])
                }
            }catch{
                print(error)
            }
        }
    }
    
    class func getChannelData(channelId: String, completion: @escaping ([Item])->Void){
        let endpoint = "channels?part=snippet&id="+channelId+"&key=AIzaSyB1dstyQMMEfg9U-7d8Tfn_n-8lInZQ4aI"
        Webservice.callApi(endpoint: endpoint) { (data) in
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(ChannelStruct.self, from: data)
                DispatchQueue.main.async {
                    completion(response.items ?? [])
                }
            }catch{
                print(error)
            }
        }
    }
}
