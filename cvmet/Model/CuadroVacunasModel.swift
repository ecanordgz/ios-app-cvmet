//
//  CuadroVacunasModel.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

struct CuadroVacunasModel: Codable {
    let historialVacunas: [HistorialVacunasModel]?
    let proximasVacunas: [ProximasVacunasModel]?
    
    private enum CodingKeys: String, CodingKey {
        case historialVacunas = "Historial"
        case proximasVacunas = "Proximas"
    }
}
