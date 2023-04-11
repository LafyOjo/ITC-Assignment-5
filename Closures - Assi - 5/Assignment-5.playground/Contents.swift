import UIKit

var greeting = "Hello, playground"


let numbers = [1, 2, 3, 4, 5]

for number in numbers {
  print(number)
}

// while loop
var i = 0

while i < 5 {
  print(i)
  i += 1
}


// do-while loop
var j = 0

repeat {
  print(j)
  j += 1
} while j < 5



extension String {
  func capitalizeFirstLetter() -> String {
    return prefix(1).capitalized + dropFirst()
  }
}

let greetingString = "hello, world!"

print(greetingString.capitalizeFirstLetter()) // prints "Hello, world!"

let numbersArray = [1, 2, 3, 4, 5]

let squaredNumbers = numbersArray.map { $0 * $0 }

print(squaredNumbers) // prints [1, 4, 9, 16, 25]



let num = [1, 2, 3, 4, 5]

let evenNumbers = num.filter { $0 % 2 == 0 }

print(evenNumbers) // prints [2, 4]




let numberList = [1, 2, 3, 4, 5, 6, 7]

let sum = numberList.reduce(0, { $0 + $1 })

print(sum) // prints 15




for i in stride(from: 0, to: 10, by: 2) {
  print(i)
}

let numbersMil = [1, 2, 3, 4, 5]

numbersMil.forEach { number in
  print(number)
}

extension Array {
  subscript(safe index: Int) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}

let numbersmam = [1, 2, 3, 4, 5]

if let thirdNumber = numbersmam[safe: 2] {
  print(thirdNumber) // prints 3
}

extension Array {
  mutating func removeFirst() -> Element? {
    guard !isEmpty else { return nil }
    return remove(at: 0)
  }
}

var numbersListTwo = [1, 2, 3, 4, 5]

numbersListTwo.removeFirst()

print(numbersListTwo) // prints [2, 3, 4, 5]



let numbersListThree = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]

let sortedNumbers = numbersListThree.sorted()

print(sortedNumbers) // prints [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]



let nestedNumbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

let flattenedNumbers = nestedNumbers.flatMap { $0 }

print(flattenedNumbers) // prints [1, 2, 3, 4, 5, 6, 7, 8, 9]
//