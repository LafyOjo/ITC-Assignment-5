//
//  ProductDetailsViewController.swift
//  NoodleCityApplication
//
//  Created by Isaiah Ojo on 09/04/2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    var userListArray = [FruitElement]()
    
    // UI Elements
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var fruitName: UILabel!
    
    @IBOutlet weak var descriptionBox: UILabel!
    
    @IBOutlet weak var furtherinformationLabel: UILabel!
    
    @IBOutlet weak var labelOneGenus: UILabel!
    
    @IBOutlet weak var labelTwoID: UILabel!
    
    @IBOutlet weak var labelThreeFamily: UILabel!
    
    @IBOutlet weak var labelFourOrder: UILabel!
    
    @IBOutlet weak var labelFiveCarbo: UILabel!
    
    @IBOutlet weak var labelSixProtein: UILabel!
    
    @IBOutlet weak var labelSevenFat: UILabel!
    
    @IBOutlet weak var labelEightCalories: UILabel!
    
    //Variables to declare the foundation where we will recieve data from other controller
    
    var fruitNameData = ""
    var fruitGenusData = ""
    var fruitIDData = ""
    var fruitFamilyData = ""
    var fruitOrderData = ""
    var fruitCarbsData = ""
    var fruitProteinData = ""
    var fruitFatData = ""
    var fruitCaloriesData = ""
    
    
    //
//       let containerView = UIView()
//       let draggableBoxView = UIView()
//       let boxContentLabel = UILabel()
//       var panGesture: UIPanGestureRecognizer!
//       var initialDraggableBoxViewY: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitName.text = fruitNameData
        labelOneGenus.text = fruitGenusData
        labelTwoID.text = fruitIDData
        labelThreeFamily.text = fruitFamilyData
        labelFourOrder.text = fruitOrderData
        labelFiveCarbo.text = fruitCarbsData
        labelSixProtein.text = fruitProteinData
        labelSevenFat.text = fruitFatData
        labelEightCalories.text = fruitCaloriesData
    }
           // Set up the container view
//              let backgroundImage = UIImage(named: "iStock-874343050")
//              containerView.backgroundColor = UIColor(patternImage: backgroundImage!)
//              containerView.frame = view.bounds
//              view.addSubview(containerView)
//
//           // Set up the container view
//           containerView.backgroundColor = UIColor.white
//           containerView.frame = view.bounds
//           view.addSubview(containerView)
//
//           // Set up the draggable box view
//           draggableBoxView.backgroundColor = UIColor.blue
//           draggableBoxView.frame = CGRect(x: 0, y: view.bounds.height - 150, width: view.bounds.width, height: 150)
//           initialDraggableBoxViewY = draggableBoxView.frame.origin.y
//           draggableBoxView.layer.cornerRadius = 10
//           draggableBoxView.clipsToBounds = true
//           containerView.addSubview(draggableBoxView)
//
//           // Set up the box content label
//           boxContentLabel.text = "This is the box content"
//           boxContentLabel.textAlignment = .center
//           boxContentLabel.textColor = UIColor.green
//           boxContentLabel.frame = draggableBoxView.bounds
//           draggableBoxView.addSubview(boxContentLabel)
//
//           // Add a pan gesture recognizer to the draggable box view
//           panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
//           draggableBoxView.addGestureRecognizer(panGesture)
//
//           // Create a stack view to hold the different elements of the right section
//           let stackView = UIStackView()
//           stackView.axis = .vertical
//           stackView.spacing = 8
//           stackView.translatesAutoresizingMaskIntoConstraints = false
//
//           // Create a label for the title
//           let titleLabel = UILabel()
//           titleLabel.text = "Title"
//           titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
//           titleLabel.textColor = UIColor.black
//           stackView.addArrangedSubview(titleLabel)
//
//           // Create a label for the subtitle
//           let subtitleLabel = UILabel()
//           subtitleLabel.text = "Subtitle"
//           subtitleLabel.font = UIFont.systemFont(ofSize: 16)
//           subtitleLabel.textColor = UIColor.gray
//           stackView.addArrangedSubview(subtitleLabel)
//
//           // Add the stack view to the draggable box view
//           draggableBoxView.addSubview(stackView)
//
//           // Set up the constraints for the stack view
//           NSLayoutConstraint.activate([
//               stackView.topAnchor.constraint(equalTo: draggableBoxView.topAnchor, constant: 16),
//               stackView.leadingAnchor.constraint(equalTo: draggableBoxView.leadingAnchor, constant: 16),
//               stackView.trailingAnchor.constraint(equalTo: draggableBoxView.trailingAnchor, constant: -16),
//               stackView.bottomAnchor.constraint(equalTo: draggableBoxView.bottomAnchor, constant: -16)
//           ])
       }

//       @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
//           let translation = recognizer.translation(in: view)
//
//           if recognizer.state == .began {
//               // Save the initial Y position of the draggable box view
//               initialDraggableBoxViewY = draggableBoxView.frame.origin.y
//           }
//
//           // Calculate the new Y position of the draggable box view based on the user's drag gesture
//           let newY = initialDraggableBoxViewY + translation.y
//           draggableBoxView.frame.origin.y = max(newY, view.bounds.height - draggableBoxView.bounds.height)
//
//           // Update the height of the draggable box view based on its Y position
//           let newHeight = view.bounds.height - draggableBoxView.frame.origin.y
//           draggableBoxView.frame.size.height = max(newHeight, 500)
//
//           // Update the content label to match the new height of the draggable box view
//           boxContentLabel.frame = draggableBoxView.bounds
//       }
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension ProductDetailsViewController:DetailsDataProtocol {
    func getMeDataFromListScreenArray(array: [FruitElement]) {
        print(array.count)
    }
}
