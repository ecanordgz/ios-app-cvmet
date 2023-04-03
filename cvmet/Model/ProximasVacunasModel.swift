//
//  ProximasVacunasModel.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

/*"Fecha": "1/1/2020 10:00:00 AM",
"IdVacuna": 9,
"NombreVacuna": "Antidoto Veneno"*/

struct ProximasVacunasModel: Codable {
    let fecha: String?
    let idVacuna: Int?
    let nombreVacuna: String?
    
    private enum CodingKeys: String, CodingKey {
        case fecha = "Fecha"
        case idVacuna = "IdVacuna"
        case nombreVacuna = "NombreVacuna"
    }
}
