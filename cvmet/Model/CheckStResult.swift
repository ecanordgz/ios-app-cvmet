//
//  CheckStResult.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

/*"Acceso": 0,
"ErrorTag": null,
"MascotasList": [],
"id": null,
"user": null*/

struct CheckStResult: Codable {
    let acceso: Int?
    let errorTag: String?
    let mascotasList: [MascotaModel]?
    let id: String?
    let user: String?
    let direccion: String?
    let telefono: String?
    let horario: String?
    let logoUrlImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case acceso = "Acceso"
        case errorTag = "ErrorTag"
        case mascotasList = "MascotasList"
        case id = "id"
        case user = "user"
        case direccion = "Direccion"
        case telefono = "Telefono"
        case horario = "Horario"
        case logoUrlImage = "StrImgLogo"
    }
}
