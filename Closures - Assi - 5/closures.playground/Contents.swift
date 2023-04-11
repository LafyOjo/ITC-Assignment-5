import UIKit

var greeting = "Hello, playground"

// Example 1: Closure as a variable
let greet = {
    print("Hello, world!")
}
greet()

// Example 2: Closure as a parameter
func performAction(action: () -> Void) {
    action()
}
performAction(action: {
    print("This is the action being performed.")
})

// Example 3: Closure as a return type
func createClosure() -> (() -> Void) {
    return {
        print("This is the closure being returned.")
    }
}
let myClosure = createClosure()
myClosure()

// Example 4: Closure with parameters and return type
func calculate(operation: (Int, Int) -> Int) -> Int {
    return operation(10, 5)
}
let add = { (a: Int, b: Int) -> Int in
    return a + b
}
let result = calculate(operation: add)
print("Result: \(result)")

// Example 5: Escaping closure
func fetchData(completionHandler: @escaping (String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completionHandler("Data fetched successfully!")
    }
}
fetchData { (data) in
    print(data)
}

// Example 6: Autoclosure
func greet2(message: @autoclosure () -> String) {
    print(message())
}
greet2(message: "Hello, world!")
