//
//  MainMenuViewController.swift
//  NoodleCityApplication
//
//  Created by Isaiah Ojo on 07/04/2023.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var mainMenuLabel: UILabel!
    
    @IBOutlet weak var onlineAPIButton: UIButton!
    
    @IBOutlet weak var detailsScreenTest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onlineAPIButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "APITableViewController")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    

    @IBAction func detailsTestScreenPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "ProductDetailsViewController")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
