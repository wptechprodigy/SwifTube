//
//  Model.swift
//  SwifTube
//
//  Created by waheedCodes on 07/01/2022.
//

import Foundation

class Model {
    
    func getVideos() {
        
        guard let url = URL(string: Constants.API_URL) else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask =  session.dataTask(
            with: URLRequest(url: url)) { data, response, error in
                
                if error != nil || data == nil {
                    return 
                }
        }
        
        dataTask.resume()
    }
}
