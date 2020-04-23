//
//  Webservice.swift
//  VideoTube
//
//  Created by Abdul Azeem on 21/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

class Webservice {
    
    class private func getRequest(urlString: String)->URLRequest {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        return request
    }
    
    class private func sendRequest(request: URLRequest, completion: @escaping (Data)->Void){
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{return}
            completion(data)
        }.resume()
    }
    
    class public func callApi(endpoint: String, completion: @escaping (Data)->Void){
        let urlString = "\(kBaseUrl)\(endpoint)"
        let request = self.getRequest(urlString: urlString)
        self.sendRequest(request: request, completion: completion)
    }
}
