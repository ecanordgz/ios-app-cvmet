//
//  ServiceManager.swift
//  cvmet
//
//  Created by Enrique Cano on 23/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import Foundation
import Alamofire

class ServicesManager: NSObject {
    
    func callLoginRequest(user loginRequestUser: String, password loginRequestPassword: String, completion: @escaping (LoginModel?) -> Void) {
        
        let urlLogin = "http://alanyj2019-002-site1.ctempurl.com/Geo.svc/CheckSt"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json" ]
        
        let parameters = [
            "correoE": loginRequestUser,
            "Pass": loginRequestPassword
        ]
        
        AF.request(urlLogin, method: .post, parameters: parameters, encoding: Alamofire.JSONEncoding.default, headers: headers).response { response in
            
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let loginModel = try decoder.decode(LoginModel.self, from: data)
                
                if loginModel.checkStResult?.direccion != nil {
                    if loginModel.checkStResult?.direccion! != "" {
                        CacheModel.direccion = (loginModel.checkStResult?.direccion)!
                    }
                }
                if loginModel.checkStResult?.telefono != nil {
                    if loginModel.checkStResult?.telefono! != "" {
                        CacheModel.telefono = (loginModel.checkStResult?.telefono)!
                    }
                }
                if loginModel.checkStResult?.horario != nil {
                    if loginModel.checkStResult?.horario! != "" {
                        CacheModel.horario = (loginModel.checkStResult?.horario)!
                    }
                }
                if loginModel.checkStResult?.logoUrlImage != nil {
                    if loginModel.checkStResult?.logoUrlImage! != "" {
                        CacheModel.logoUrlImage = (loginModel.checkStResult?.logoUrlImage)!
                    }
                }
                if (loginModel.checkStResult?.mascotasList?.count)! > 0 {
                    CacheModel.listMascotas = (loginModel.checkStResult?.mascotasList)!
                }
                
                completion(loginModel)
            } catch let error {
                print("*************")
                print("*** ERROR ***")
                print("callLoginRequest: ")
                print(error)
                completion(nil)
            }
            
        }
    }
    
    func callUpdateTokenRequest(userName: String, token: String, completion: @escaping (TokenModel?) -> Void) {
        
        let urlToken = "http://alanyj2019-002-site1.ctempurl.com/Geo.svc/UpdateToken"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json" ]
        
        let parameters = [
            "username": userName,
            "Token": token
        ]
        
        AF.request(urlToken, method: .post, parameters: parameters, encoding: Alamofire.JSONEncoding.default, headers: headers).response { response in
            
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let tokenModel = try decoder.decode(TokenModel.self, from: data)
                
                completion(tokenModel)
            } catch let error {
                print("*************")
                print("*** ERROR ***")
                print("callUpdateTokenRequest: ")
                print(error)
                completion(nil)
            }
            
        }
    }
    
}
