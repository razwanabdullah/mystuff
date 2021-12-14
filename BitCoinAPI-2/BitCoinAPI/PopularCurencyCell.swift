//
//  PopularCurencyCell.swift
//  BitCoinAPI
//
//  Created by Razwan on 13/12/2021.
//

import UIKit

class PopularCurencyCell: UITableViewCell {

    
    @IBOutlet weak var currencyName: UILabel!
    
    
    @IBOutlet weak var rate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
