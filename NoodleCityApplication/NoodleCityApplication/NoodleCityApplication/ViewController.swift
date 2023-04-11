//
//  ViewController.swift
//  NoodleCityApplication
//
//  Created by Isaiah Ojo on 07/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homePageImage: UIImageView!
    
    @IBOutlet weak var labelTitleOne: UILabel!
    
    @IBOutlet weak var labelTitleTwo: UILabel!
    
    @IBOutlet weak var labelTextOne: UILabel!
    
    @IBOutlet weak var labelTextTwo: UILabel!
    
    @IBOutlet weak var labelTextThree: UILabel!
    
    @IBOutlet weak var labelTextFour: UILabel!
    
    @IBOutlet weak var labelTextFive: UILabel!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "MainMenuViewController")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

