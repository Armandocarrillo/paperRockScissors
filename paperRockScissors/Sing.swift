//
//  Sing.swift
//  paperRockScissors
//
//  Created by Armando Carrillo on 31/03/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoise = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoise.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1{
        return .paper
    } else {
        return .scissors
    }
    
}

enum Sign {
    case paper, rock, scissors
    
    var emoji: String{
    switch self {
    case .paper:
    return "🖐"
    case .rock:
    return "👊"
    case .scissors:
    return "✌️"
    }
}
    func takeTurn(_ opponent: Sign)-> GameState {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
            }
        case .paper:
            switch opponent {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.lose
            }
        case .scissors:
                switch opponent {
                case .rock:
                    return GameState.lose
                case .paper:
                    return GameState.win
                case .scissors:
                    return GameState.draw
        
        }
    }
}
}
