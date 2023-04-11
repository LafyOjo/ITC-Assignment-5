import Foundation

// MARK: - FruitElement
struct FruitElement: Codable {
    let genus, name: String
    let id: Int
    let family, order: String
    let nutritions: Nutritions
}

// MARK: - Nutritions
struct Nutritions: Codable {
    let carbohydrates, protein, fat: Double
    let calories: Int
    let sugar: Double
}

typealias Fruit = [FruitElement]
