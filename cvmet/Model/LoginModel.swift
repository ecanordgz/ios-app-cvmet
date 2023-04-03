//
//  LoginModel.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    let checkStResult: CheckStResult?
    
    private enum CodingKeys: String, CodingKey {
        case checkStResult = "CheckStResult"
    }
}
