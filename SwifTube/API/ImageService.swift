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
        
        guard let url = URL(string: thumbnailURL) else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            if error == nil && data != nil {
                if url.absoluteString != thumbnailURL {
                    return
                }
                
                let videoThumbnail = UIImage(data: data!)!
                
                DispatchQueue.main.async {
                    completion(videoThumbnail)
                }
            }
        }
        
        dataTask.resume()
    }
}
