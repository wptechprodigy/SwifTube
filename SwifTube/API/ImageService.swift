//
//  ImageService.swift
//  SwifTube
//
//  Created by waheedCodes on 08/01/2022.
//

import UIKit

class ImageService {
    
    typealias VideoThumbnail = (UIImage) -> Void
    static let shared = ImageService()
    
    func getImage(from thumbnailURL: String,
                  completion: @escaping VideoThumbnail) {
        
        if let cachedData = CacheManager.getVideoCache(thumbnailURL) {
            let cachedImage = UIImage(data: cachedData)!
            completion(cachedImage)
            return
        }
        
        guard let url = URL(string: thumbnailURL) else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            if error == nil && data != nil {
                
                if url.absoluteString != thumbnailURL {
                    return
                }
                
                CacheManager.setVideoCache(thumbnailURL, data: data)
                let videoThumbnail = UIImage(data: data!)!
                
                DispatchQueue.main.async {
                    completion(videoThumbnail)
                }
            }
        }
        
        dataTask.resume()
    }
}
