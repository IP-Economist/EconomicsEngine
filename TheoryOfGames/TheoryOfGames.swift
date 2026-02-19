//
//  TheoryOfGames.swift
//  economicengine
//
//  Created by IP-Economist on 1/27/26.
//

/// Strategy
class Strategy {
    /// Name of a strategy
    var name: String
    /// Value of a strategy
    /// -  An Encoder can be applied
    var value: Int
    
    init(
        name: String,
        value: Int
    ) {
        self.name = name
        self.value = value
    }
}

/// Theory of games for calculation of strategies of players
class Player {
    var name: String
    var strategies: [Strategy]
    
    init(
        name: String,
        strategies: [Strategy]
    ) {
        self.name = name
        self.strategies = strategies
    }
}

/// Тheory of games for calculation with circumstances or scripts
class CaseGame {
    var name: String
    var strategies: [Strategy]
    
    init(
        name: String,
        strategies: [Strategy]
    ) {
        self.name = name
        self.strategies = strategies
    }
}

class TheoryOfGames {
    /// Name of a game
    var name: String
    var players: [Player]?
    var cases: [CaseGame]?
    
    init(
        name: String,
        players: [Player],
    ) {
        self.name = name
        self.players = players
        self.cases = nil
    }
    
    init(
        name: String,
        cases: [CaseGame]
    ){
        self.name = name
        self.players = nil
        self.cases = cases
    }
}
