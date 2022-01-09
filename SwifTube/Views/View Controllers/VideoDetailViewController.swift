//
//  VideoDetailViewController.swift
//  SwifTube
//
//  Created by waheedCodes on 09/01/2022.
//

import UIKit
import WebKit

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Clear all fields
        clearAllFields()
        setFields(with: video)
    }
    
    private func clearAllFields() {
        self.titleLabel.text = ""
        self.dateLabel.text = ""
        self.descriptionTextView.text = ""
    }
    
    private func setFields(with aVideo: Video?) {
        guard let currentVideo = aVideo else {
            return
        }
        let embedURLString = Constants.BASE_YT_EMBED_URL + currentVideo.videoId
        let url = URL(string: embedURLString)!
        let request = URLRequest(url: url)
        webView.load(request)
        
        titleLabel.text = currentVideo.title
        dateLabel.text = formatDate(currentVideo.publishedAt)
        descriptionTextView.text = currentVideo.description
    }
}
