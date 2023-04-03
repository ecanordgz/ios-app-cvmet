//
//  HistorialMedicoModel.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

struct HistorialMedicoModel: Codable {
    let diagnostico: String?
    let fecha: String?
    let idConsulta: Int?
    let sintomas: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case diagnostico = "Diagnostico"
        case fecha = "Fecha"
        case idConsulta = "IdConsulta"
        case sintomas = "Sintomas"
    }
}
