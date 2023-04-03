//
//  HistoriaMedicaViewController.swift
//  cvmet
//
//  Created by Enrique Cano on 24/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit

class HistoriaMedicaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    struct HistoriaMedica {
        var sectionName: String!
        var sectionHistoriaMedica: [DetalleHistoriaMedicaModel]!
        var isExpanded: Bool!
    }
    
    var historiaMedicaArray = [HistoriaMedica]()
    var sourceHistoriaMedicaArray = [HistorialMedicoModel]()
    
    
    @IBOutlet weak var historiaMedicaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for item in sourceHistoriaMedicaArray {
            var detalleHistoriaArray = [DetalleHistoriaMedicaModel]()
            
            var detalleHistoria = DetalleHistoriaMedicaModel(sectionNameDetalleHistoria: "Sintomas", seccionDetalleHistoria: item.sintomas!)
            detalleHistoriaArray.append(detalleHistoria)
            
            detalleHistoria = DetalleHistoriaMedicaModel(sectionNameDetalleHistoria: "Diagnóstico", seccionDetalleHistoria: [item.diagnostico!])
            detalleHistoriaArray.append(detalleHistoria)
            
            let historiaMedicaItem = HistoriaMedica(sectionName: item.fecha, sectionHistoriaMedica: detalleHistoriaArray, isExpanded: false)
            
            historiaMedicaArray.append(historiaMedicaItem)
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !historiaMedicaArray[section].isExpanded {
            return 0
        }
        
        return historiaMedicaArray[section].sectionHistoriaMedica.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historiaMedicaTableView.dequeueReusableCell(withIdentifier: "Cell") as! HistoriaMedicaTableViewCell
        
        cell.detalleHistoriaArray = historiaMedicaArray[indexPath.section].sectionHistoriaMedica
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return historiaMedicaArray.count
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return historiaMedicaArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor(red: 246/255, green: 241/255, blue: 247/255, alpha: 1.0)
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(red: 170/255, green: 122/255, blue: 168/255, alpha: 1.0)
        
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame: CGRect = tableView.frame
        
        let imageButton = historiaMedicaArray[section].isExpanded! ? "ico-collapse" : "ico-expanded"
        
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: 40))
        button.setTitle(historiaMedicaArray[section].sectionName, for: .normal)
        button.setTitleColor(UIColor(red: 170/255, green: 122/255, blue: 168/255, alpha: 1.0), for: .normal)
        button.setImage(UIImage(named: imageButton), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 246/255, green: 241/255, blue: 247/255, alpha: 1.0)
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        button.tag = section
        
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        headerView.addSubview(button)
        
        headerView.layoutIfNeeded()
        
        let titleButtonPosition = button.frame.size.width - button.titleLabel!.frame.width
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -titleButtonPosition, bottom: 0.0, right: 0.0)
        
        let imageButtonPosition = button.frame.size.width + (button.titleLabel!.frame.width / 2) + button.imageView!.frame.width + 15.0
        button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -imageButtonPosition)
        
        return headerView
    }
    
    @objc func handleExpandClose(button: UIButton) {
        //print("Entro aquí....!!!!")
        //print(button.tag)
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in historiaMedicaArray[section].sectionHistoriaMedica.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = historiaMedicaArray[section].isExpanded!
        historiaMedicaArray[section].isExpanded = !isExpanded
        
        //button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        button.setImage(UIImage(named: isExpanded ? "ico-expanded" : "ico-collapse"), for: .normal)
        
        if isExpanded {
            historiaMedicaTableView.deleteRows(at: indexPaths, with: .fade)
        }
        else {
            historiaMedicaTableView.insertRows(at: indexPaths, with: .fade)
        }
        
        //historiaMedicaArray[section].sectionHistoriaMedica.removeAll()
        //historiaMedicaTableView.deleteRows(at: indexPaths, with: .fade)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
