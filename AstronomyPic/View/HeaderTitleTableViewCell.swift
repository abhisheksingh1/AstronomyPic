//
//  HeaderTitleTableViewCell.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import UIKit

class HeaderTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    static var identifier: String {
        return String(describing: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        super.awakeFromNib()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
