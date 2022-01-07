//
//  ConstantsTemplate.swift
//  SwifTube
//
//  Created by waheedCodes on 07/01/2022.
//

import Foundation

struct ConstantsTemplate {
    static var API_KEY = "[API_KEY]"
    static var PLAYLIST_ID = "[PlaylistID]"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(ConstantsTemplate.PLAYLIST_ID)&key=\(ConstantsTemplate.API_KEY)"
}
