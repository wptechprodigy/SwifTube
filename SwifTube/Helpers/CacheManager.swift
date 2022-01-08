//
//  CacheManager.swift
//  SwifTube
//
//  Created by waheedCodes on 08/01/2022.
//

import Foundation

class CacheManager {
    
    static var cache: [String: Data] = [:]
    
    static func setVideoCache(_ url: String, data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
