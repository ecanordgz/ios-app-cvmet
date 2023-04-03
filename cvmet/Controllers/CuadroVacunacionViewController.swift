//
//  CuadroVacunacionViewController.swift
//  cvmet
//
//  Created by Enrique Cano on 24/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit

class CuadroVacunacionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    struct DetalleVacunas {
        var fecha: String?
        var idVacuna: Int?
        var nombreVacuna: String?
    }
    
    struct Vacunas {
        var sectionName: String!
        var sectionVacunas: [DetalleVacunas]!
    }
    
    var vacunasArray = [Vacunas]()
    var historialVacunas = [HistorialVacunasModel]()
    var proximasVacunas = [ProximasVacunasModel]()
    
    @IBOutlet weak var detalleMascotaTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var detalleVacunasAplicadasArray = [DetalleVacunas]()
        for item in historialVacunas {
            let detalleVacuna = DetalleVacunas(fecha: item.fecha, idVacuna: item.idVacuna, nombreVacuna: item.nombreVacuna)
            detalleVacunasAplicadasArray.append(detalleVacuna)
        }
        
        let vacunasAplicadas = Vacunas(sectionName: "APLICADAS", sectionVacunas: detalleVacunasAplicadasArray)
        
        var detalleVacunasProximasArray = [DetalleVacunas]()
        for item in proximasVacunas {
            let detalleVacuna = DetalleVacunas(fecha: item.fecha, idVacuna: item.idVacuna, nombreVacuna: item.nombreVacuna)
            detalleVacunasProximasArray.append(detalleVacuna)
        }
        
        let vacunasProximas = Vacunas(sectionName: "PRÓXIMAS", sectionVacunas: detalleVacunasProximasArray)
        
        vacunasArray.append(vacunasAplicadas)
        vacunasArray.append(vacunasProximas)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacunasArray[section].sectionVacunas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detalleMascotaTableView.dequeueReusableCell(withIdentifier: "Cell") as! CuadroVacunacionTableViewCell
        
        cell.setNombreVacuna(nombreVacuna: vacunasArray[indexPath.section].sectionVacunas[indexPath.row].nombreVacuna!)
        cell.setFechaVacuna(fechaVacuna: vacunasArray[indexPath.section].sectionVacunas[indexPath.row].fecha!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return vacunasArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return vacunasArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        /*header.textLabel?.frame = CGRect(x: (header.textLabel?.frame.origin.x)!,
                                         y: (header.textLabel?.frame.origin.y)!,
                                         width: (header.textLabel?.frame.width)!,
                                         height: (header.textLabel?.frame.height)! + 20)*/
        header.textLabel?.textColor = UIColor(red: 73/255, green: 135/255, blue: 189/255, alpha: 1.0)
        header.textLabel?.textAlignment = .center
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}
