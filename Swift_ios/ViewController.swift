//
//  ViewController.swift
//  Swift_ios
//
//  Created by RHCT on 15/12/28.
//  Copyright © 2015年 ZL. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: BaseViewController {
    
    deinit {
        
    }
    

    func addTwoNumber(a: Int)(num: Int) -> Int {
        return a + num
    }
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    func backwrd(s1: String, s2: String) -> Bool {
        return s1 > s2
    }
    
    func someFunctionThatTakesClosure( flot: Float, closure: () -> Void) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let value = calculateStatistics([])
        print("\(value.max) + \(value.min) + \(value.sum)")
        
        let result = sumOf(1, 2, 3, 4, 5)
        print("\(result)")
        let addToFour = addTwoNumber(4)
        _ = addToFour(num: 10)
        
//        var revered = names.sort(backwrd)
//        
//        revered = names.sort({(s1: String, s2: String) -> Bool in
//            return s1 > s2})
//        revered = names.sort({s1, s2 in return s1 > s2})
//        revered = names.sort({s1, s2 in s1 > s2})
//        revered = names.sort({ $0 > $1})
//        revered = names.sort(>)
//        
//        someFunctionThatTakesClosure(10) { () -> Void in
//            
//        }
//        someFunctionThatTakesClosure{ () -> Void in
//            
//        }
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let strings:[String] = numbers.map { (var number) -> String in
            var output = ""
            while number > 0 {
                output = digitNames[number % 10]! + output
                number /= 10
            }
            return output
        }
        debugPrint("Strings:\(strings)")
        
        let array = [1, 2, 3, 4, 5]
        let ava = array.reduce(0.0) { (total, index) -> Float in
            return total + Float(index)/Float(array.count)
        }
        debugPrint("average:\(ava)")
    }
    
    
    
    func printLog<T>(message: T, file: String = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
        
    }
    
    func calculateStatistics(scroes: [Int]) -> (min: Int, max: Int, sum: Int) {
        if scroes.count == 0 {
            return (-1, -1, -1)
        }
        var min = scroes[0]
        var max = scroes[0]
        var sum = 0
        
        for scroe in scroes {
            if scroe > max {
                max = scroe
            } else if scroe < min {
                min = scroe
            }
            sum += scroe
        }
        
        return (min, max, sum)
    }

    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    func returnFifteen() -> Int {
        var y = 10
        
        func add() {
            y += 5
        }
            
        add()
        return y
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension NSNumber {
    class func add(a: NSNumber, b: NSNumber) -> NSNumber {
        return NSNumber(integer: a.integerValue + b.integerValue)
    }
    
    class func curry(localAdd:(NSNumber, NSNumber) -> NSNumber) {
        
    }
    
    class func curry2(localAdd:(NSNumber, NSNumber) -> NSNumber) -> (NSNumber -> (NSNumber -> NSNumber)) {
        return { a in
            { b in
                return localAdd(a, b)
            }
        }
    }
    
    func curry3<A, B, C>(f:(A, B) -> C) -> (A -> (B -> C)) {
        return { a in
            { b in
                return f(a, b)
            }
        }
    }
    
    func curry4<A, B, C>(f:(A, B) -> C) -> (A -> (B -> C)) {
        return {a in {b in f(a, b) } }
    }
    
    func curry5<A, B, C>(f:(A, B) -> C) -> A -> B -> C {
        return { a in { b in f(a, b) } }
    }
}
