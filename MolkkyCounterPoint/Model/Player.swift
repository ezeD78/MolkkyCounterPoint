//
//  Joueur.swift
//  molky2
//
//  Created by Ezequiel Gomes on 29/01/2024.
//

import Foundation

class Player: Hashable {

    var name: String
    var score = 0
    var consecutiveZeroCount = 0
    var eliminate = false
    var winner = false
    init(name: String) {
        self.name = name
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    func reset () {
        score = 0
        consecutiveZeroCount = 0
        eliminate = false
         winner = false

    }

}
