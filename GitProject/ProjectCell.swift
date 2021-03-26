//
//  ProjectCell.swift
//  GitProject
//
//  Created by Jayakrishnan u on 3/26/21.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var details: UILabel!
    @IBOutlet var stars: UILabel!
    @IBOutlet var language: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
