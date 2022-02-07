//
//  ViewController.swift
//  loginApp
//
//  Created by Максим Хабиров on 08.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userLoginTF: UITextField!
    @IBOutlet weak var passwordLoginTF: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeWC = segue.destination as? WelcomeViewController else {return}
        welcomeWC.user = user
    }

    @IBAction func loginButtonPress() {
        if userLoginTF.text != user || passwordLoginTF.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct login or password",
                textField: passwordLoginTF
            )
        }
    }
    
    @IBAction func forgotUserNameButtonPress() {
        showAlert(
            title: "Ooops!",
            message: "Your user name is: User"
            )
    }
    
    @IBAction func forgotPasswordPress() {
        showAlert(
            title: "Ooops!",
            message: "Your password is: Password"
        )
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userLoginTF.text = ""
        passwordLoginTF.text = ""
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userLoginTF {
            passwordLoginTF.becomeFirstResponder()
        } else {
            loginButtonPress()
        }
        return true
    }
}
