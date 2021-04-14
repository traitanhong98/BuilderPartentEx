//
//  DataModel.swift
//  NguyenMinhHoang_downloadImg
//
//  Created by Hoang on 3/15/21.
//  Copyright © 2021 Hoang. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class DataModel {
    private let albumURL = "https://my-json-server.typicode.com/congeovi/albums/db"
    private let photoURL = "https://my-json-server.typicode.com/congeovi/photos/db"
    
    var listAlbums = [Album]()
    var listPhotos = [Photo]()
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func getData<T: Mappable>(fromUrl urlString: String, completionBlock: @escaping (Bool, T?)-> Void ) {
        guard let url = URL(string: urlString) else {
            completionBlock(false, nil)
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            // Check if data was received successfully
            if error == nil && data != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
                    if let dataObject = T.init(JSON: json) {
                        completionBlock(true, dataObject)
                    } else {
                        completionBlock(false, nil)
                    }
                } catch {
                    completionBlock(false, nil)
                }
            }
        }).resume()
    }
    func downloadImage(from url: URL, successBlock: @escaping (UIImage)->Void, failBlock: @escaping ()->Void) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                failBlock()
                return
            }
            DispatchQueue.main.async() {
                guard let image = UIImage(data: data) else {
                    failBlock()
                    return
                }
                successBlock(image)
            }
        }
    }
    func getListAlbum(completionBlock: @escaping ()->Void ) {
        getData(fromUrl: albumURL) { (isSuccess, albums: Albums?) in
            self.listAlbums = albums?.albums ?? []
            completionBlock()
        }
    }
    func getListPhotos(completionBlock: @escaping ()->Void ) {
        getData(fromUrl: photoURL) { (isSuccess, photos: Photos?) in
            self.listPhotos = photos?.photos ?? []
            completionBlock()
        }
    }
}
