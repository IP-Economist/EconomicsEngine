//
//  Combinatorics.swift
//  economicengine
//
//  Created by IP-Economist on 1/27/26.
//

import Foundation

/// Combinatorics
public class Combinatorics {
    
    /// Factorial
    public static func factorial(_ n: Int, from x: Int = 1) -> Int {
        precondition(x <= n, "The initial number x must be less than or equal to n [x<=n]")
        var result: Int = 1
        
        for i in x..<(n+1) {
            result *= i
        }
        return result
    }
    
    /// The binomial coefficient from n to k.
    /// k permutations of n objects
    /// - parameter k: k permutations
    /// - parameter n: n objects
    public static func C_unsafe(k: Int, n: Int) -> Int {
        let startValue = n - k + 1
        print("LOG: startValue = \(n) - \(k) + 1 = \(startValue)")
        let fact = factorial(n, from: startValue)
        print("LOG: factorial(\(n), from: \(startValue) = \(fact)")
        return  fact / factorial(k)
    }
    
    public static func C_safe(k: Int, n: Int) throws -> Float {
        let logResult = lgammaf(Float(n + 1)) - lgammaf(Float(k+1)) - lgammaf(Float(n - k + 1))
        
        if logResult > log(Float.greatestFiniteMagnitude) {
            throw EconomicError
                .Overflow("The result is more: \(Float.greatestFiniteMagnitude)")
        }
        return exp(logResult)
    }
}
