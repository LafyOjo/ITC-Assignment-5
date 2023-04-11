//
//  APITableViewController.swift
//  NoodleCityApplication
//
//  Created by Isaiah Ojo on 07/04/2023.
//

import UIKit

class APITableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var gridViewButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var userListArray = [FruitElement]()
    let FruitInfo = Fruit()
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        networkManager.delegate = self
        //        networkManager.callAPIToGetData()
        getDataUsingClosures()
    }
    
    func getDataUsingClosures(){
        networkManager.getDataFromAPIUsingClosure{result in
            switch result{
            case .success(let user):
                self.userListArray = user
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                
                // Do any additional setup after loading the view.
            }
        }
    }
                                    
    @IBAction func gridButtonClicked(_ sender: UIButton) {
        let cvc = self.storyboard?.instantiateViewController(withIdentifier: "GridCollectionViewController") as! GridCollectionViewController
        cvc.fruitInfo = self.userListArray
        self.navigationController?.pushViewController(cvc, animated: true)
    }
                                              
                                              
    func callAPIToGetData(){
        
        
        // URLSession - this will manage network request response
        // URLSessionDataTask - fetch the data
        
        /*
         1. Data Task - API Fetching
         2. Upload Task - To upload something to server
         3. Download Task - to download some files from server
         
         
         1. Get - retrieve information from server/api
         2. Post. - to send data to server/api
         3. Put - send without any acknowledgment
         4. Delete - delete data from api
         5. Update - ammend data
         */
        
        let urlString = "https://fruityvice.com/api/fruit/all"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in  // Completion handler is a closure
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error for response")
                return
            }
            
            guard let data = data else {
                print("Couldn't get data from API")
                return
            }
            
            do{
                let userList = try JSONDecoder().decode([FruitElement].self, from: data)
                self.userListArray = userList
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch{
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
                                              }
                                              
    extension APITableViewController {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return userListArray.count
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "APITableViewCellData") as! APITableTableViewCell
            let user = userListArray[indexPath.item]
            cell.labelOneGenus.text = "Name: \(user.name)"
            
            let pdvc = ProductDetailsViewController()
            pdvc.fruitNameData = user.name
            pdvc.fruitGenusData = user.genus
            pdvc.fruitIDData = user.id.description
            pdvc.fruitFamilyData = user.family
            pdvc.fruitOrderData = user.order
            pdvc.fruitCarbsData = user.nutritions.carbohydrates.description
            pdvc.fruitProteinData = user.nutritions.protein.description
            pdvc.fruitFatData = user.nutritions.fat.description
            pdvc.fruitCaloriesData = user.nutritions.calories.description
            
            return cell
        }
    }
                                              
    extension APITableViewController{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let pdvc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
            let value = userListArray[indexPath.row]
            pdvc.fruitNameData = "Fruit: \(value.name.description)"
            pdvc.fruitGenusData = "Genus: \(value.genus.description)"
            pdvc.fruitIDData = "ID: \(value.id.description)"
            pdvc.fruitFamilyData = "Family \(value.family.description)"
            pdvc.fruitOrderData = "Order: \(value.order.description)"
            pdvc.fruitCarbsData = "Carbs: \(value.nutritions.carbohydrates.description)"
            pdvc.fruitProteinData = "Protein: \(value.nutritions.protein.description)"
            pdvc.fruitFatData = "Fat: \(value.nutritions.fat.description)"
            pdvc.fruitCaloriesData = "Calories \(value.nutritions.calories.description)"
            self.navigationController?.pushViewController(pdvc, animated: true)
        }
    }
                                              
    extension APITableViewController: NetworkResponseProtocol {
        func didFinishWithResponseArray(array: [FruitElement]) {
            self.userListArray = array
            //        DispatchQueue.main.async {
            //            self.tableView.reloadData()
            //        }/.getMeDataFromListScreenArray(array: array)
            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //        let dcv = storyboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
            //        //delegate
            print(array)
        }
        
        func didRecieveError(error: Error) {
            print(error)
        }
    }
                                              
                                              
