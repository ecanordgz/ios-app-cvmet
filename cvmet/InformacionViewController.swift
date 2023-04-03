//
//  InformacionViewController.swift
//  cvmet
//
//  Created by Enrique Cano on 16/01/21.
//  Copyright © 2021 Enrique Cano. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class InformacionViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if CacheModel.logoUrlImage != "" {
            logoImage.af_setImage(withURL: URL(string: CacheModel.logoUrlImage)!)
        }
        else {
            logoImage.image = UIImage(named: "img-logo")
        }
        
        direccionLabel.text = CacheModel.direccion
        direccionLabel.numberOfLines = 0
        telefonoLabel.text = CacheModel.telefono
        horarioLabel.text = CacheModel.horario
    }

}
