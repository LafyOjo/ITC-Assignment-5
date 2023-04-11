//
//  GridCollectionViewController.swift
//  NoodleCityApplication
//
//  Created by Isaiah Ojo on 09/04/2023.
//

import UIKit

class GridCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let networkManager = NetworkManager()
    let gvcc = GridCollectionViewCell()
    var fruitArrayString = [String]()
    var fruitInfo = [FruitElement]()
    var fruitControl = Fruit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        getDataUsingClosures()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func listViewButtonPressedDown(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func getDataUsingClosures(){
        networkManager.getDataFromAPIUsingClosure{result in
            switch result{
            case .success(let user):
                self.fruitInfo = user
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                // Do any additional setup after loading the view.
            }
        }
    }
}

extension GridCollectionViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellPartID", for: indexPath) as! GridCollectionViewCell 
        for fruit in fruitInfo {
            fruitArrayString.append(fruit.name.description)
        }
            print(fruitInfo[indexPath.item].name.description)
            cell.gridLabelOne.text = fruitArrayString[indexPath.item]
            return cell
        }
}

        extension GridCollectionViewController {
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let pdvc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
                let value = fruitInfo[indexPath.row]
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
        
        
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        

