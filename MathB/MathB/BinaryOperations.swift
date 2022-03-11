//
//  BinaryOperations.swift
//  MathA
//
//  Created by Ashish Awasthi on 3/11/22.
//

import Foundation

public struct BinaryOperation {
    
    public init() {}
    
    public func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    public func div(_ a: Int, _ b: Int) -> Int {
        return a / b
    }
    public func sub(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    public func mult(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
   
    public func mod(_ a: Int, _ b: Int) -> Int {
        return a % b
    }
}
