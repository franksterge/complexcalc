//
//  main.swift
//  ComplexCalc
//
//  Created by Ted Neward on 10/4/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

 print("UW Complex Calculator v0.1")

let calc = Calculator()  // Don't change this declaration name; it's used in all the tests below

// ====> Add your own tests here if you wish <====


// ====> Do not modify code in this section <====
 assert(calc.add(lhs: 2, rhs: 2) == 4)
 assert(calc.subtract(lhs: 2, rhs: 2) == 0)
 assert(calc.multiply(lhs: 2, rhs: 2) == 4)
 assert(calc.divide(lhs: 2, rhs: 2) == 1)

 assert(calc.mathOp(lhs: 5, rhs: 5, op: { ($0 + $1) + ($0 * $1) }) == 35)
 assert(calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20)

 assert(calc.add([1, 2, 3, 4, 5]) == 15)
 assert(calc.multiply([1, 2, 3, 4, 5]) == 120)
 assert(calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8)
 assert(calc.count([]) == 0)
 assert(calc.avg([2, 2, 2, 2, 2, 2]) == 2)
 assert(calc.avg([1, 2, 3, 4, 5]) == 3)
 assert(calc.avg([1]) == 1)

 assert(calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6)
//    // this is (((0 op 1) op 2) op 3)
 assert(calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15)
//    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
 assert(calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1)
//    // this is (((((1 op 1) op 1) op 1) op 1) op 1)
//
let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
 assert(calc.add(lhs: p1, rhs: p2) == (17, -22))
 assert(calc.subtract(lhs: p1, rhs: p2) == (-7, 32))
 assert(calc.add(lhs: p4, rhs: p4) == (0, 0))
 assert(calc.add(lhs: p3, rhs: p4) == (-4, 4))

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]
 assert(calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9])
 assert(calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1])
//
