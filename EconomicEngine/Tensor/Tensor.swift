//
//  Tensor.swift
//  EconomicEngine
//
//  Created by IP-Economist on 1/27/26.
//

import Foundation


/// tensor
/// - parameter shape: form of a tensor `(rows: Int, columns: Int)`
/// - parameter data: numeric data `[[Number]]`
public class Tensor {
    /// form of a tensor
    public var shape: (rows: Int, columns: Int)
    /// Data
    public var data: [[Number]]
    
    // MARK: - init(_data)
    
    /// By data
    /// - parameter data: `[[Number]]`
    public init(_ data: [[Number]]) {
        self.data = data
        self.shape = (data.count, data[0].count)
    }
    
    // MARK: - init(shape)
    
    /// Only forms
    /// - parameter shape: (rows: Int, columns: Int)
    /// - parameter fill: default 0 auto filling `data`
    public init (shape: (rows: Int, columns: Int), fill: Number = 0){
        self.shape = shape
        self.data = Array(
            repeating: Array(repeating: fill, count: shape.columns),
            count: shape.rows
        )
    }
    
    // MARK: - Subscript
    
    /// Quick access to any row, column by subscript
    /// - parameter row: Int row
    /// - parameter column: Int column
    /// - returns: any number ``Number``
    public subscript (_ row: Int, _ column: Int) -> Number {
        get { self.data[row][column] }
        set { self.data[row][column] = newValue}
    }
    
    // MARK: - tensorRank()
    
    /// Rank of a tensor
    /// - returns: Rank of a tensor ``EconomicEngine/TensorRank``
    public func tensorRank() -> TensorRank {
        if self.shape.rows == 1 && self.shape.columns == 1 {
            return TensorRank.scalar
        }
        else if self.shape.rows == 1 && self.shape.columns > 1{
            return TensorRank.vector
        }
        else if self.shape.rows > 1 && self.shape.columns > 1 {
            return TensorRank.matrix
        }
        else {
            return TensorRank.tensor
        }
    }
    
    // MARK: - %()
    
    /// Transponing of a tensor
    /// - parameter right: tensor
    /// - returns: tensor
    public static prefix func *|(right: Tensor) -> Tensor {
        var result = Tensor(shape: (right.shape.columns, right.shape.rows))
        for i in 0..<right.shape.rows {
            for j in 0..<right.shape.columns {
                result[j, i] = right[i, j]
            }
        }
        return result
    }
    
    // MARK: - **()
    
    // TODO: Matrices multiplication
    /// Matrices multiplication of tensors
    /// - Warning: function in dev
    public static func **(left: Tensor, right: Tensor) -> Tensor {
        var result = Tensor([])
        return result
    }
    
    // MARK: - +()
    
    ///
    public static func +(left: Tensor, right: Tensor){
        
    }
    
    // MARK: - -()
    
    ///
    public static func -(left: Tensor, right: Tensor){
        
    }
    
    // MARK: - *()
    
    ///
    public static func *(left: Tensor, right: Tensor){
        
    }

    // MARK: - /()
    
    ///
    public static func /(left: Tensor, right: Tensor){
        
    }
}



