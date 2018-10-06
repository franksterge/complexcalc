//
//  Calculator.swift
//  ComplexCalc
//
//  Created by Ted Neward on 10/4/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//
//Fangwen Ge
//Info 449
//10.8.18
//this program is a complex calculator that is capable to do various operations
//for both possitive and negative integers including addtion, subtraction, multiplication, and
//division as well as complex operation including counting the number of
//integers in a given list, taking the average for the given list, and taking factorial for a given
//integer.


import Foundation

// All your work will go in here
class Calculator {
    public func add (lhs: Int, rhs: Int) -> Int {
        return Int(lhs + rhs)
    }
    
    public func add(_ list: [Int]) -> Int {
        var result = 0
        for i in list {
            result += i
        }
        return result
    }
    
    public func add (lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 + rhs.0, lhs.1 + rhs.1)
    }
    
    public func add (lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        return ["x": lhs["x"]! + rhs["x"]!,
                "y": lhs["y"]! + rhs["y"]!] as [String: Int]
    }
    public func subtract (lhs: Int, rhs: Int) -> Int {
        return Int(lhs - rhs)
    }
    
    public func subtract (lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 - rhs.0, lhs.1 - rhs.1)
    }
    
    public func subtract (lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        return ["x": lhs["x"]! - rhs["x"]!,
                "y": lhs["y"]! - rhs["y"]!] as [String: Int]
    }
    
    public func multiply (lhs: Int, rhs: Int) -> Int {
        return Int(lhs * rhs)
    }
    
    public func multiply (_ list: [Int]) -> Int {
        var result: Int
        switch list.count {
        case 0:
             result = 0
        default:
            result = list[0]
            for i in 1...list.count - 1 {
                result = multiply(lhs: result, rhs: list[i])
            }
        }
        return result
    }
    
    public func divide (lhs: Int, rhs: Int) -> Int {
        switch rhs {
        case 0:
            return 0;
        default :
            return Int (lhs / rhs);
        }
    }
    
    public func count (_ list: [Int]) -> Int {
        return list.count
    }
    
    public func avg (_ list: [Int]) -> Int {
        return add(list) / Int(list.count)
    }
    
    public func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    public func mathOp(args: [Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        return opHelper(args, beg, op, 0)
    }
    
    private func opHelper(_ args:[Int], _ result: Int, _ op: (Int, Int) -> Int, _ index: Int) -> Int {
        switch index {
        case args.count:
            return result
        default:
            return opHelper(args, op(args[index], result), op, index + 1)
        }
    }
}

