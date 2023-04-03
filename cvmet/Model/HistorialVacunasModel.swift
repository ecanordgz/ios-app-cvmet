//
//  HistorialVacunasModel.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

/*"Fecha": "1/1/2020 11:00:00 AM",
"IdVacuna": 6,
"NombreVacuna": "Rabia"*/

struct HistorialVacunasModel: Codable {
    let fecha: String?
    let idVacuna: Int?
    let nombreVacuna: String?
    
    private enum CodingKeys: String, CodingKey {
        case fecha = "Fecha"
        case idVacuna = "IdVacuna"
        case nombreVacuna = "NombreVacuna"
    }
}
