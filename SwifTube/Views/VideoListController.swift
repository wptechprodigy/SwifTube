//
//  VideoListController.swift
//  SwifTube
//
//  Created by waheedCodes on 06/01/2022.
//

import UIKit

class VideoListController: UITableViewController {
    
    var apiService: APIService = APIService()
    private var videoList: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getVideoList()
    }
    
    // MARK: - Helper Methods
    
    private func getVideoList() {
        apiService.getVideos { [weak self] videoItems in
            self?.videoList = videoItems
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - TableView Methods
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell",
                                                 for: indexPath)
        let videoTitle = videoList[indexPath.row].title
        cell.textLabel?.text = videoTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
