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
//for possitive and negative integers, list of integers, and cartisan points.

import Foundation

// All your work will go in here
class Calculator {
    //adds two integers together and returns the value
    public func add (lhs: Int, rhs: Int) -> Int {
        return Int(lhs + rhs)
    }
    
    //gets the sum of the list of the integer
    public func add(_ list: [Int]) -> Int {
        var result = 0
        for i in list {
            result += i
        }
        return result
    }
    
    //adds two cartisan points together and returns the result
    public func add (lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 + rhs.0, lhs.1 + rhs.1)
    }
    
    //adds two cartisan points in the form of dictionaries together and returns the result
    public func add (lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        return ["x": lhs["x"]! + rhs["x"]!,
                "y": lhs["y"]! + rhs["y"]!] as [String: Int]
    }
    
    //subtracts two integers and returns the result
    public func subtract (lhs: Int, rhs: Int) -> Int {
        return Int(lhs - rhs)
    }
    
    //subtracts two cartisan points and returns the result
    public func subtract (lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 - rhs.0, lhs.1 - rhs.1)
    }
    
    //subtracts two cartisan points in the form of dictionaries together and returns the result
    public func subtract (lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        return ["x": lhs["x"]! - rhs["x"]!,
                "y": lhs["y"]! - rhs["y"]!] as [String: Int]
    }
    
    //multiplies two integers and returns the result
    public func multiply (lhs: Int, rhs: Int) -> Int {
        return Int(lhs * rhs)
    }
    
    //cumulatively multiplies a list of integer and returns the result
    public func multiply (_ list: [Int]) -> Int {
        var result: Int
        switch list.count {
        case 0:
             result = 0
        default:
            result = list[0]
            for i in 1...list.count - 1 {
                result *= list[i]
            }
        }
        return result
    }
    
    //divides the first integer passed in by the second and returns the result.
    public func divide (lhs: Int, rhs: Int) -> Int {
        switch rhs {
        case 0:
            return 0;
        default :
            return Int (lhs / rhs);
        }
    }
    
    //counts the size of the list of integer passed in and returns the result.
    public func count (_ list: [Int]) -> Int {
        return list.count
    }
    
    //calculates the arithmatic mean of the list of integer passed in and returns the result.
    public func avg (_ list: [Int]) -> Int {
        return add(list) / Int(list.count)
    }
    
    //takes in two integers and applies the given custom operation and returns the result.
    public func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    //takes in a base integer and a list of the integer and applies the given custom operation and returns the result.
    public func mathOp(args: [Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        return opHelper(args, beg, op, 0)
    }
    
    //helper method that calculate a custom operation with given list of a integer, the current index of that list, and carries out the result and returns it.
    private func opHelper(_ args:[Int], _ result: Int, _ op: (Int, Int) -> Int, _ index: Int) -> Int {
        switch index {
        case args.count:
            return result
        default:
            return opHelper(args, op(args[index], result), op, index + 1)
        }
    }
}

