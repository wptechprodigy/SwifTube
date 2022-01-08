//
//  APIService.swift
//  SwifTube
//
//  Created by waheedCodes on 07/01/2022.
//

import Foundation

final class APIService {
    
    typealias FetchedVideos = ([Video]) -> Void
    
    func getVideos(completion: @escaping FetchedVideos) {
        
        guard let url = URL(string: Constants.API_URL) else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask =  session.dataTask(
            with: URLRequest(url: url)) { data, response, error in
                
                if error != nil || data == nil {
                    return 
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                do {
                    let videoList = try decoder.decode(Response.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion(videoList.items)
                    }
                } catch {
                    print("Error: \(error)")
                }
        }
        
        dataTask.resume()
    }
}
