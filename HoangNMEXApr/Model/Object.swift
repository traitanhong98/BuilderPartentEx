//
//  Object.swift
//  NguyenMinhHoang_downloadImg
//
//  Created by Hoang on 3/15/21.
//  Copyright © 2021 Hoang. All rights reserved.
//

import Foundation
import ObjectMapper


class Albums: Mappable {
    required init?(map: Map) {}
    var albums: [Album]?
    
    func mapping(map: Map) {
        albums    <- map["albums"]
    }
}
class Album: Mappable {
    required init?(map: Map) {}
    
    var id: Int?
    var title: String?
    var numberOfImage: Int = 0
    func mapping(map: Map) {
        id    <- map["id"]
        title <- map["title"]
    }
}
class Photos: Mappable {
    required init?(map: Map) {}
    var photos: [Photo]?
    
    func mapping(map: Map) {
        photos    <- map["photos"]
    }
}
class Photo: Mappable {
    required init?(map: Map) {}
    
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
    var photo: UIImage?
    var state: State = .pending
    func mapping(map: Map) {
        albumId         <- map["albumId"]
        id              <- map["id"]
        title           <- map["title"]
        url             <- map["url"]
        thumbnailUrl    <- map["thumbnailUrl"]
    }
}
enum State {
    case pending,executing,canceled, done
}
