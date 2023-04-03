//
//  TokenModel.swift
//  cvmet
//
//  Created by Enrique Cano on 4/4/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation

struct TokenModel: Codable {
    let updateTokenResult: UpdateTokenResult?
    
    private enum CodingKeys: String, CodingKey {
        case updateTokenResult = "UpdateTokenResult"
    }
}
