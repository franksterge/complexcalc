//
//  Calculator.swift
//  ComplexCalc
//
//  Created by Ted Neward on 10/4/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

// All your work will go in here
class Calculator{
    public func add (lhs: Double, rhs: Double) -> Double{
        return Double(lhs + rhs)
    }
    
    public func add(_ list: [Double]) -> Double{
        var result = 0.0
        for i in list{
            result += i
        }
        return result
    }
    
    public func add (lhs: (Double, Double), rhs: (Double, Double)) -> (Double, Double){
        return (lhs.0 + rhs.0, lhs.1 + rhs.1)
    }
    public func subtract (lhs: Double, rhs: Double) -> Double{
        return Double(lhs - rhs)
    }
    
    public func multiply (lhs: Double, rhs: Double) -> Double{
        return Double(lhs * rhs)
    }
    
    public func multiply (_ list: [Double]) -> Double{
        var result: Double
        switch list.count{
        case 0:
             result = 0.0
        default:
            result = list[0]
            for i in 1...list.count - 1{
                result = multiply(lhs: result, rhs: list[i])
            }
        }
        return result
    }
    
    public func divide (lhs: Double, rhs: Double) -> Double{
        switch rhs{
        case 0:
            return 0;
        default :
            return Double (lhs / rhs);
        }
    }
    
    public func count (_ list: [Double]) -> Int{
        return list.count
    }
    
    public func avg (_ list: [Double]) -> Double{
        return add(list) / Double(list.count)
    }
    
    public func mathOp(lhs: Double, rhs: Double, op: (Double, Double) -> Double) -> Double{
        return op(lhs, rhs)
    }
    
    public func mathOp(args: [Double], beg: Double, op: (Double, Double) -> Double) -> Double{
        return opHelper(args, beg, op, 0)
    }
    
    private func opHelper(_ args:[Double], _ result: Double, _ op: (Double, Double) -> Double, _ index: Int) -> Double{
        switch index{
        case args.count:
            return result
        default:
            return opHelper(args, op(args[index], result), op, index + 1)
        }
    }
}

