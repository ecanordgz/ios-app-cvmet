//
//  UpdateTokenResult.swift
//  cvmet
//
//  Created by Enrique Cano on 4/4/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

struct UpdateTokenResult: Codable {
    let Completado: Int?
    let errorTag: String?
    
    private enum CodingKeys: String, CodingKey {
        case Completado = "Completado"
        case errorTag = "errorTag"
    }
}
