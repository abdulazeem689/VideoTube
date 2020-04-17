//
//  HelpingMethods.swift
//  VideoTube
//
//  Created by Abdul Azeem on 15/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

class HelpingMethods {
    
    class func duration(duration: String)->String {
        var str = ""
        var temp = ""
        var flagH = false
        var flagM = false
        for char in duration {
            if char.isNumber {
               temp+=String(char)
            }
            if char == "H" {
                str += temp+":"
                temp = ""
                flagH = true
            }
            if char == "M" {
                if flagH == true && temp.count == 1 {
                    temp = "0"+temp
                }
                str += temp+":"
                temp = ""
                flagM = true
            }
        }
        if(temp==""){
            temp = "00"
        }
        temp = temp.count==1 ? "0"+temp : temp
        str += flagM ? temp : flagH ? "00:"+temp : "0:"+temp
        return str
    }
    
    class func views(views: Int)->String {
        return views>=1000000 ? "\(views/1000000)M" : (views>=1000 ? "\(views/1000)k" : "\(views)")
    }
    
    class func publishedAt(publishedAt: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: publishedAt)
        let from = Date()
        return from.offset(from: date!)
    }
}

