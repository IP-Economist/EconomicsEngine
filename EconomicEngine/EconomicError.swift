//
//  EconomicError.swift
//  economicengine
//
//  Created by IP-Economist on 1/27/26.
//


/// Error
public enum EconomicError: Error {
    /// Abscence of a parameter
    case ParamAbsent(String)
    /// Arithmetic overflow
    case Overflow(String)
}
