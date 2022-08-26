//
//  ViewController.swift
//  Closures
//
//  Created by Luca Berardinelli on 26/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// ------------------- Example 1
        print(eseguiOperazione(x: 2, y: 3, closure: somma))
        func somma(a:Int, b:Int) -> Int {
            return a + b
        }
        func eseguiOperazione(x:Int, y:Int, closure : @escaping (_ a:Int,_ b:Int) -> (Int)) -> Int {
            return closure(x,y)
        }
        
        /// ------------------- Example 2
        var greaterThan3 : ((Int) -> Bool) = { number in
            return number > 3
        }
        print(greaterThan3(4))
        
        /// ------------------- Example 3
        let sayHello = {
            print("Hi!")
        }
        sayHello()
        let sayHello2 = { (_ name: String) -> () in
            print("Hi \(name)!")
        }
        sayHello2("Luca")
        
        /// ------------------- Example 4
        func getUserData(for id: Int) -> String {
            if id == 1989 {
                return "Taylor Swift"
            } else {
                return "Anonymous"
            }
        }
        var data: (Int) -> String = getUserData
        var user = data(1989)
        print(user)
        
        /// ------------------- Example 5
        func filterWithClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
            var filtered: [Int] = []
            numbers.forEach { num in
                closure(num) ? filtered.append(num) : nil
            }
            return filtered
        }
        func greaterThanNumber(value: Int) -> Bool {
            return value > 3
        }
        func lesserThanNumber(value: Int) -> Bool {
            return value < 3
        }
        print(filterWithClosure(closure: greaterThanNumber, numbers: [1,2,3,4,5,6]))
        print(filterWithClosure(closure: lesserThanNumber, numbers: [1,2,3,4,5,6]))
    }
}


