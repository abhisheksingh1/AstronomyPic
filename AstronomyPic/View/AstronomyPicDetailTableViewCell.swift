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
    
    func configureUI() {
        
    }
}
