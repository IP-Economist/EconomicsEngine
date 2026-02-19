//
//  TensorRank.swift
//  economicengine
//
//  Created by IP-Economist on 1/27/26.
//

import Foundation

/// Rank of a tensor
public enum TensorRank: String, CaseIterable, Hashable {
    /// Scalar
    case scalar = "scalar"
    /// Vector
    case vector = "vector"
    /// matrix
    case matrix = "matrix"
    /// Just a tensor
    case tensor = "tensor"
}

