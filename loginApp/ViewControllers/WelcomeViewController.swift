//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by Максим Хабиров on 08.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user)"
    }
 
    @IBAction func logOutButtonPress() {
        dismiss(animated: true)
    }
}
