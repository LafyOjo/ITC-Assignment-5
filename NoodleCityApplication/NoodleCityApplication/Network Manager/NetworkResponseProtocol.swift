//
//  NetworkResponseProtocol.swift
//  NoodleCityApplication
//
//  Created by Isaiah Ojo on 09/04/2023.
//

import Foundation

protocol NetworkResponseProtocol {
    func didFinishWithResponseArray(array:[FruitElement]) -> Void
    func didRecieveError(error: Error)
}

protocol DetailsDataProtocol {
    func getMeDataFromListScreenArray(array: [FruitElement])
}
