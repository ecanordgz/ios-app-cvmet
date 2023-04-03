//
//  DetalleMascotaViewController.swift
//  cvmet
//
//  Created by Enrique Cano on 21/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetalleMascotaViewController: UIViewController {

    var historialVacunas = [HistorialVacunasModel]()
    var proximasVacunas = [ProximasVacunasModel]()
    var historiaMedica = [HistorialMedicoModel]()
    var urlImage = URL(string: "")
    var nombreMascota = ""
    var razaMascota = ""
    var tipoMascota = ""
    var estadoMascota = 0
    
    @IBOutlet weak var contenedorView: UIView!
    
    @IBOutlet weak var perfilMascotaImageView: UIImageView!
    @IBOutlet weak var nombreMascotaLabel: UILabel!
    @IBOutlet weak var razaMascotaLabel: UILabel!
    @IBOutlet weak var tipoMascotaLabel: UILabel!
    @IBOutlet weak var estadoMascotaImageView: UIImageView!
    @IBOutlet weak var estadoMascotaLabel: UILabel!
    
    @IBOutlet weak var buttonVacunacion: UIButton!
    @IBOutlet weak var buttonHistoria: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if urlImage?.absoluteString != "" {
            let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
                size: perfilMascotaImageView.frame.size,
                radius: 40.0
            )
            
            perfilMascotaImageView.af_setImage(withURL: urlImage!, filter: filter)
        }
        
        if nombreMascota != "" {
            nombreMascotaLabel.text = nombreMascota
        }
        
        if razaMascota != "" {
            razaMascotaLabel.text = razaMascota
        }
        
        if tipoMascota != "" {
            tipoMascotaLabel.text = tipoMascota
        }
        
        if estadoMascota != 0 {
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
        
        initCuadroVacunacionView()
        
    }
    
    func initCuadroVacunacionView() {
        
        if let viewWithTag = contenedorView.viewWithTag(200) {
            viewWithTag.removeFromSuperview()
        }
        
        let controllerCuadroVacunacion: CuadroVacunacionViewController = self.storyboard!.instantiateViewController(withIdentifier: "CuadroVacunacionViewController") as! CuadroVacunacionViewController
        
        controllerCuadroVacunacion.proximasVacunas = self.proximasVacunas
        controllerCuadroVacunacion.historialVacunas = self.historialVacunas
        
        controllerCuadroVacunacion.willMove(toParent: self)
        self.addChild(controllerCuadroVacunacion)
        controllerCuadroVacunacion.didMove(toParent: self)
        
        contenedorView.addSubview(controllerCuadroVacunacion.view)
    }
    
    func initHistoriaMedicaView() {
        
        if let viewWithTag = contenedorView.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
        
        let controllerHistoriaMedica: HistoriaMedicaViewController = self.storyboard!.instantiateViewController(withIdentifier: "HistoriaMedicaViewController") as! HistoriaMedicaViewController
        
        controllerHistoriaMedica.sourceHistoriaMedicaArray = historiaMedica
        
        controllerHistoriaMedica.willMove(toParent: self)
        self.addChild(controllerHistoriaMedica)
        controllerHistoriaMedica.didMove(toParent: self)
        
        contenedorView.addSubview(controllerHistoriaMedica.view)
    }
    
    @IBAction func buttonCerrarTouchUp(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonVacunacionTouchUp(_ sender: UIButton) {
        
        buttonVacunacion.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        buttonHistoria.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 233/255, alpha: 1.0)
        initCuadroVacunacionView()
    }
    
    @IBAction func buttonHistoriaTouchUp(_ sender: UIButton) {
        
        buttonVacunacion.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 233/255, alpha: 1.0)
        buttonHistoria.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        initHistoriaMedicaView()
    }
    
}
