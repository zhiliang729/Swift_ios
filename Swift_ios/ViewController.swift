//
//  ViewController.swift
//  Swift_ios
//
//  Created by RHCT on 15/12/28.
//  Copyright © 2015年 ZL. All rights reserved.
//


class ViewController: BaseViewController {
    
    deinit {
        
    }
    

    func addTwoNumber(a: Int)(num: Int) -> Int {
        return a + num
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let value = calculateStatistics([])
        print("\(value.max) + \(value.min) + \(value.sum)")
        
        let result = sumOf(1, 2, 3, 4, 5)
        print("\(result)")
        
        
        let xs = ["A", "B", "C"]
        let generator = CountdownGenerator(array: xs)
        while let i = generator.next() {
            print("Element \(i) of the array is \(xs[i])")
        }
        
        let xx = [1, 2, 3, 4]
        let ge = CountdownGenerator(array: [1, 2, 3])
        while let i = ge.next() {
            print("Element \(i) of the array is \(xx[i])")
        }
        
        let xl = ["A", "B", "C"]
        let reverseSequence = ReverseSequence(array: xl)
        let reverseGenerator = reverseSequence.generate()
        while let i = reverseGenerator.next() {
            print("Index \(i) is \(xl[i])")
        }
        
        for i in ReverseSequence(array: xl) {
            print("Index \(i) is \(xl[i])")
        }
        
        
        let addToFour = addTwoNumber(4)
        _ = addToFour(num: 10)
        
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


