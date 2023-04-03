//
//  ViewController.swift
//  cvmet
//
//  Created by Enrique Cano on 20/01/20.
//  Copyright © 2020 Enrique Cano. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        usuarioTextField.delegate = self;
        passwordTextField.delegate = self;
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil);
    }
    
    deinit {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil);
    }

    @objc func keyboardWillChange(notification: Notification) {
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
           notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
            view.frame.origin.y = -keyboardRect.height;
            
        }
        else {
            view.frame.origin.y = 0;
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    @IBAction func buttonEntrarTouchUp(_ sender: UIButton) {
        
        if usuarioTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            let alert = UIAlertController(title: "Mensaje", message: "Ingresa un usuario por favor.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            let alert = UIAlertController(title: "Mensaje", message: "Ingresa una contraseña por favor.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let servicesManager = ServicesManager()
            
            servicesManager.callLoginRequest(user: usuarioTextField.text!, password: passwordTextField.text!) { (loginModel) in
                if (loginModel?.checkStResult?.acceso)! > 0 {
                    
                    let tokenUserDevice = Messaging.messaging().fcmToken;
                    servicesManager.callUpdateTokenRequest(userName: self.usuarioTextField.text!, token: tokenUserDevice!, completion: { (tokenModel) in
                        
                        let completado = tokenModel?.updateTokenResult?.Completado;
                        let error = tokenModel?.updateTokenResult?.errorTag;
                        
                        print("******************************************");
                        print("TOKEN UPDATE RESULT");
                        print("Completado: \(completado ?? 0)");
                        print("errorTag: \(error ?? "Error en la llamada al servicio.")");
                        print("******************************************");
                    })
                    
                    if let tabViewController = self.storyboard!.instantiateViewController(withIdentifier: "InicioTabBarController") as? InicioTabBarController {
                        tabViewController.modalPresentationStyle = .fullScreen
                        self.present(tabViewController, animated: true, completion: nil)
                    }
                }
                else {
                    let alert = UIAlertController(title: "Mensaje", message: "El usuario o contraseña no es válido. Favor de intentar nuevamente.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        
    }
    
}

