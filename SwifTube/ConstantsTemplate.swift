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
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
