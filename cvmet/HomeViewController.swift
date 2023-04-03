//
//  HomeViewController.swift
//  cvmet
//
//  Created by Enrique Cano on 21/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //var tareas: [String] = []
    
    @IBOutlet weak var mascotasTableView: UITableView!
    @IBOutlet weak var logoClienteImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //tareas = ["Tarea Uno", "Tarea Dos", "Tarea 3", "Tarea 4"]
        // Evita mostrar la separación de la tabla
        self.mascotasTableView.separatorColor = UIColor.clear
        
        if CacheModel.logoUrlImage != "" {
            logoClienteImageView.af_setImage(withURL: URL(string: CacheModel.logoUrlImage)!)
        }
        else {
            logoClienteImageView.image = UIImage(named: "img-logo")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CacheModel.listMascotas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mascotasCell") as! MascotasTableViewCell
        
        cell.setPerfilMascotaImage(urlImage: URL(string: CacheModel.listMascotas[indexPath.row].strImagen!)!)
        cell.setNombreMascotaLabel(nombreMascota: CacheModel.listMascotas[indexPath.row].nombre!)
        cell.setRazaMascotaLabel(razaMascota: CacheModel.listMascotas[indexPath.row].raza!)
        cell.setTipoMascotaLabel(tipoMascota: CacheModel.listMascotas[indexPath.row].especie!)
        cell.setEstadoMascota(estadoMascota: CacheModel.listMascotas[indexPath.row].estado!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: MascotasTableViewCell = tableView.cellForRow(at: indexPath) as! MascotasTableViewCell
        
        let detalleMascotaViewController: DetalleMascotaViewController = self.storyboard!.instantiateViewController(withIdentifier: "DetalleMascotaViewController") as! DetalleMascotaViewController
        
        detalleMascotaViewController.historialVacunas = (CacheModel.listMascotas[indexPath.row].cuadroVacunas?.historialVacunas)!
        detalleMascotaViewController.proximasVacunas = (CacheModel.listMascotas[indexPath.row].cuadroVacunas?.proximasVacunas)!
        detalleMascotaViewController.historiaMedica = CacheModel.listMascotas[indexPath.row].historialMedico!
        detalleMascotaViewController.urlImage = URL(string: CacheModel.listMascotas[indexPath.row].strImagen!)
        detalleMascotaViewController.nombreMascota = CacheModel.listMascotas[indexPath.row].nombre!
        detalleMascotaViewController.razaMascota = CacheModel.listMascotas[indexPath.row].raza!
        detalleMascotaViewController.tipoMascota = CacheModel.listMascotas[indexPath.row].especie!
        detalleMascotaViewController.estadoMascota = CacheModel.listMascotas[indexPath.row].estado!
        
        detalleMascotaViewController.modalPresentationStyle = .fullScreen
        self.present(detalleMascotaViewController, animated: true, completion: nil)
    }
}
