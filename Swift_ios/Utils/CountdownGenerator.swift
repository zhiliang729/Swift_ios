//
//  CountdownGenerator.swift
//  Swift_ios
//
//  Created by RHCT on 16/1/11.
//  Copyright © 2016年 ZL. All rights reserved.
//

import Foundation

protocol hello {
    
    typealias Elem: Equatable
    
    func change(ele: Elem) -> Elem
    
}

class CountdownGenerator: GeneratorType {
    typealias Element = Int
    
    var element: Element
    
    init<T>(array: [T]) {
        self.element = array.count - 1
    }

    func next() -> CountdownGenerator.Element? {
        return self.element < 0 ? nil : element--
    }
    
}

struct ReverseSequence<T>: SequenceType{
    
    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    typealias Generator = CountdownGenerator
    
    func generate() -> ReverseSequence.Generator {
        return CountdownGenerator(array: array)
    }
    
}


extension CountdownGenerator : hello {
    typealias Elem = String
    
    func change(ele: Elem) -> CountdownGenerator.Elem {
        return ele
    }
}
