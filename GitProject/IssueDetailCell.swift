//
//  IssueDetailCell.swift
//  GitProject
//
//  Created by Jayakrishnan u on 3/26/21.
//

import UIKit

class IssueDetailCell: UITableViewCell {

    @IBOutlet var issueTitle: UILabel!
    @IBOutlet var issueDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
