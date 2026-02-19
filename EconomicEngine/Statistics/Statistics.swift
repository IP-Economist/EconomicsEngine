//
//  Statistics.swift
//  economicengine
//
//  Created by IP-Economist on 1/27/26.
//


public prefix func %(right: Double) -> String {
    return String(format: "%.2f", right * 100.0)+"%"
}

///
public class Probability {
    /// The number of desired event outcomes
    public var casesSuit: Int
    /// The number of all possible outcomes
    public var casesAll: Int
    /// Sample size
    public var sampleAll: Int? = nil
    /// Number of desired outcomes in the sample
    public var sampleSuit: Int? = nil
    
    ///
    public init(
        casesSuit: Int,
        casesAll: Int
    ) {
        self.casesSuit = casesSuit
        self.casesAll = casesAll
    }
    
    public init(
        casesSuit: Int,
        casesAll: Int,
        sampleAll: Int,
        sampleSuit: Int
    ) {
        self.casesSuit = casesSuit
        self.casesAll = casesAll
        self.sampleSuit = sampleSuit
        self.sampleAll = sampleAll
    }
    
    ///
    subscript(_ suit: Int, _ cases: Int) -> Double {
        get { Double(suit) / Double(cases) }
    }
    
    /// Calculating the usual probability of P(A)
    /// - parameter textify: `(Double) -> ()`
    ///
    /// ## usage
    /// ```swift
    /// let prob = Probability(suit: 4, from: 10)
    /// prob.probability({pr in
    ///     print("Вероятность: \(pr)")
    /// })
    /// ```
    public func probability(_ textify: (Double) -> ()) {
        return textify(Double(self.casesSuit) / Double(self.casesAll))
    }
    
    ///
    public func probability() -> Double {
        return Double(self.casesSuit) / Double(self.casesAll)
    }
    
    ///
    public static prefix func ?%(prob: Probability) -> Double {
        return Double(prob.casesSuit) / Double(prob.casesAll)
    }
    
    /// Hypergeometric distribution
    public func hypergeometryDistribution() throws -> Double {
        guard let sAll = self.sampleAll else {
            throw EconomicError.ParamAbsent("Missing selection")
        }
        guard let sSuit = self.sampleSuit else {
            throw EconomicError.ParamAbsent("The desired selection result is missing")
        }

        let C_k_K = try Combinatorics.C_safe(k: sSuit, n: self.casesSuit)
        print("LOG: C_k_K = \(C_k_K)")
        let C_nk_NK = try Combinatorics.C_safe(
            k: sAll - sSuit,
            n: self.casesAll - self.casesSuit
        )
        print("LOG: C_n-k_N-K = \(C_nk_NK)")

        let C_n_N = try Combinatorics.C_safe(k: sAll, n: self.casesAll)
        print("LOG: C_n_N = \(C_n_N)")
        return Double(C_k_K * C_nk_NK) / Double(C_n_N)
    }
}
