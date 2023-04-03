//
//  DetalleMascotaTableViewCell.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit

class CuadroVacunacionTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreVacunaLabel: UILabel!
    @IBOutlet weak var fechaVacuaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setNombreVacuna(nombreVacuna: String) {
        nombreVacunaLabel.text = nombreVacuna
    }
    
    func setFechaVacuna(fechaVacuna: String) {
        fechaVacuaLabel.text = fechaVacuna
    }

}
