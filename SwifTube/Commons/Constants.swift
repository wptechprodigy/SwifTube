//
//  Constants.swift
//  SwifTube
//
//  Created by waheedCodes on 06/01/2022.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyCZzbeIzRhtSK7UO6xugp6ztfcwis1uO-s"
    static var PLAYLIST_ID = "PLpvpznviFFFI1YpMxb3fQNWKzqvR9BOlv"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
