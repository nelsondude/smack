//
//  ChannelCell.swift
//  Smack
//
//  Created by Alexander Nelson on 12/25/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
//    Outlets
    @IBOutlet weak var channelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }

        // Configure the view for the selected state
    }
    func configureCell(channel: Channel) {
        if let title = channel.name {
            channelName.text = "# \(title)"
        } else {
            channelName.text = "Didnt Work Here"
        }
    }

}
