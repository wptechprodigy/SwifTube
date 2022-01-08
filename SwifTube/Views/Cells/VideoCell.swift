//
//  VideoCell.swift
//  SwifTube
//
//  Created by waheedCodes on 08/01/2022.
//

import UIKit

class VideoCell: UITableViewCell {
    
    static let identifier = "VideoCell"
    var video: Video?
    var imageService: ImageService!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with aVideo: Video) {
        self.video = aVideo
        
        if let currentVideo = self.video {
            self.titleLabel.text = currentVideo.title
            self.dateLabel.text = formatDate(currentVideo.publishedAt)
            imageService.getImage(from: currentVideo.thumbnail,
                                  completion: { [weak self] videoThumbnail in
                self?.thumbnailImageView.image = videoThumbnail
            })
        }
    }
}
