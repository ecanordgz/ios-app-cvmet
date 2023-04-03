//
//  DetalleHistoriaTableViewCell.swift
//  cvmet
//
//  Created by Enrique Cano on 24/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit

class DetalleHistoriaTableViewCell: UITableViewCell {

    @IBOutlet weak var descripcionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDescripcionText(descripcionText: String) {
        descripcionLabel.text = descripcionText
    }

}
