//
//  PhotoTableViewCell.swift
//  NetworkManager
//
//  Created by Shawn Li on 5/20/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell
{

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitleLab: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
