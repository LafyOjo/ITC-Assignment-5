//
//  NetworkManager.swift
//  NoodleCityApplication
//
//  Created by Isaiah Ojo on 07/04/2023.
//

import Foundation

class NetworkManager {
    
    var delegate: NetworkResponseProtocol?
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
                self.delegate?.didRecieveError(error: error)
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
                //  self.userListArray = userList
                // DispatchQueue.main.async {
                //    self.tableView.reloadData()
                //        }
                // print(userList)
                self.delegate?.didFinishWithResponseArray(array: userList)
            } catch{
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
    
    func getDataFromAPIUsingClosure(handler: @escaping (Result<[FruitElement], Error>) -> Void ){
        
        let urlString = "https://fruityvice.com/api/fruit/all"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in  // Completion handler is a closure
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.didRecieveError(error: error)
                handler(.failure(error))
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
                handler(.success(userList))
                //  self.userListArray = userList
                // DispatchQueue.main.async {
                //    self.tableView.reloadData()
                //        }
                // print(userList)
                self.delegate?.didFinishWithResponseArray(array: userList)
            } catch{
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
    
}


