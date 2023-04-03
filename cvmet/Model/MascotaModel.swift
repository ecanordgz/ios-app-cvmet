//
//  MascotaModel.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

/*"Especie": "PERRO",
"Estado": 1,
"Nombre": "Yon",
"Raza": "Maltes",
"StrImagen": "http://alanyj2019-001-site1.ctempurl.com/images/perro.jpg",
"id": 4 */

struct MascotaModel: Codable {
    let cuadroVacunas: CuadroVacunasModel?
    let especie: String?
    let estado: Int?
    let historialMedico: [HistorialMedicoModel]?
    let nombre: String?
    let raza: String?
    let strImagen: String?
    let id: Int?
    
    private enum CodingKeys: String, CodingKey {
        case cuadroVacunas = "CuadroVacunas"
        case especie = "Especie"
        case estado = "Estado"
        case historialMedico = "HistorialMedico"
        case nombre = "Nombre"
        case raza = "Raza"
        case strImagen = "StrImagen"
        case id = "id"
    }
}
