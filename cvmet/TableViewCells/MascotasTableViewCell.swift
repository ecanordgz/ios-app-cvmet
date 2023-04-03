//
//  MascotasTableViewCell.swift
//  cvmet
//
//  Created by Enrique Cano on 21/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MascotasTableViewCell: UITableViewCell {

    @IBOutlet weak var perfilMascotaImageView: UIImageView!
    @IBOutlet weak var nombreMascotaLabel: UILabel!
    @IBOutlet weak var razaMascotaLabel: UILabel!
    @IBOutlet weak var tipoMascotaLabel: UILabel!
    @IBOutlet weak var estadoMascotaImageView: UIImageView!
    @IBOutlet weak var estadoMascotaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setPerfilMascotaImage(urlImage: URL) {
        
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: perfilMascotaImageView.frame.size,
            radius: 30.0
        )
        
        perfilMascotaImageView.af_setImage(withURL: urlImage, filter: filter)
    }
    
    func setNombreMascotaLabel(nombreMascota: String) {
        nombreMascotaLabel.text = nombreMascota
    }
    
    func setRazaMascotaLabel(razaMascota: String) {
        razaMascotaLabel.text = razaMascota
    }
    
    func setTipoMascotaLabel(tipoMascota: String) {
        tipoMascotaLabel.text = tipoMascota
    }
    
    func setEstadoMascota(estadoMascota: Int) {
        switch estadoMascota {
        case 1:
            estadoMascotaImageView.image = UIImage(named: "img-enorden")
            estadoMascotaLabel.text = "En orden"
            estadoMascotaLabel.textColor = UIColor(red: 190/255, green: 205/255, blue: 69/255, alpha: 1.0)
            break
        case 2:
            estadoMascotaImageView.image = UIImage(named: "img-revisar")
            estadoMascotaLabel.text = "Revisar"
            estadoMascotaLabel.textColor = UIColor(red: 237/255, green: 194/255, blue: 66/255, alpha: 1.0)
            break
        case 3:
            estadoMascotaImageView.image = UIImage(named: "img-atencion")
            estadoMascotaLabel.text = "Atención"
            estadoMascotaLabel.textColor = UIColor(red: 206/255, green: 66/255, blue: 42/255, alpha: 1.0)
        default:
            break
        }
    }

}
