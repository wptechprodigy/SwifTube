//
//  Response.swift
//  SwifTube
//
//  Created by waheedCodes on 07/01/2022.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]
    
    private enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
