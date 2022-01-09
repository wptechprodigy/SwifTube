//
//  VideoListController.swift
//  SwifTube
//
//  Created by waheedCodes on 06/01/2022.
//

import UIKit

class VideoListController: UITableViewController {
    
    var apiService: APIService = APIService()
    var imageService: ImageService = ImageService.shared
    private var videoList: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getVideoList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedVideoIndexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        let selectedVideo = videoList[selectedVideoIndexPath.row]
        let videoDetailViewController = segue.destination as! VideoDetailViewController
        videoDetailViewController.video = selectedVideo
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
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.identifier,
                                                 for: indexPath) as! VideoCell
        cell.imageService = imageService
        let video = videoList[indexPath.row]
        cell.configureCell(with: video)
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
