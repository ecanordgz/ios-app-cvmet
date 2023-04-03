//
//  HistoriaMedicaTableViewCell.swift
//  cvmet
//
//  Created by Enrique Cano on 24/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit

class HistoriaMedicaTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    var detalleHistoriaArray = [DetalleHistoriaMedicaModel]()
    
    @IBOutlet weak var detalleHistoriaMedicaTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        detalleHistoriaMedicaTableView.dataSource = self
        detalleHistoriaMedicaTableView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (detalleHistoriaArray[section].seccionDetalleHistoria?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detalleHistoriaMedicaTableView.dequeueReusableCell(withIdentifier: "CellDetalle") as! DetalleHistoriaTableViewCell
        
        cell.setDescripcionText(descripcionText: detalleHistoriaArray[indexPath.section].seccionDetalleHistoria![indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return detalleHistoriaArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return detalleHistoriaArray[section].sectionNameDetalleHistoria
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}
