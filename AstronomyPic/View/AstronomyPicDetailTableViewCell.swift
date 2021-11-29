//
//  AstronomyPicDetailTableViewCell.swift
//  AstronomyPic
//
//  Created by user on 28/11/21.
//

import UIKit

class AstronomyPicDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var shortExplanationLbl: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    static var identifier: String {
        return String(describing: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI(_ picDetail: PictureDetail?) {
        guard let picDetail = picDetail else { return }
        imageHeightConstraint.constant = UIScreen.main.bounds.height/2
        if let picData = picDetail.pictureImage {
            picImageView.image = UIImage(data: picData)
        }
        shortExplanationLbl.text = picDetail.explanation
    }
}
