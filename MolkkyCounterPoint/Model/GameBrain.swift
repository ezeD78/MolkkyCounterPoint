//
//  GameBrain.swift
//  molky2
//
//  Created by Ezequiel Gomes on 29/01/2024.
//

import Foundation

class GameBrain: ObservableObject, Hashable {

    var isOn: Bool
    var players: [Player] = []
    private var listeJoueurElimine: [Player] = []
    @Published var tourCounter = 0
    @Published var currentPlayerNumber = 0
    @Published var alert = false
    var message = Message(message: "")

    static func == (lhs: GameBrain, rhs: GameBrain) -> Bool {
        return lhs.tourCounter ==  rhs.tourCounter
    }

    init(nomJoueurs: [String], isOne: Bool) {
        for nomjoueur in nomJoueurs {
            self.players.append(Player(name: nomjoueur))
        }
        self.isOn = isOne
    }

    init(joueurs: [Player]) {
        for joueur in joueurs {
            joueur.reset()
        }
        self.players = joueurs
        self.isOn = true
    }

    init() {
        self.isOn = true

    }

    func encode(with coder: NSCoder) {
            coder.encode(isOn, forKey: "isOn")
            coder.encode(players, forKey: "joueurs")
            coder.encode(listeJoueurElimine, forKey: "listeJoueurElimine")
            coder.encode(tourCounter, forKey: "nbtour")
            coder.encode(currentPlayerNumber, forKey: "numeroJoueurEnCours")
            coder.encode(alert, forKey: "alert")
            coder.encode(message, forKey: "message")
        }

    func valideTourJoueur(scoreJoueur: Int) {

        if scoreJoueur == 0 {
            if isOn {
                players[currentPlayerNumber].consecutiveZeroCount += 1
                if players[currentPlayerNumber].consecutiveZeroCount == 3 {

                    players[currentPlayerNumber].eliminate = true
                    listeJoueurElimine.append(players[currentPlayerNumber])
                    message.message = "\(players[currentPlayerNumber].name) est éliminé 💔"
                    players.remove(at: currentPlayerNumber)

                    if players.count == 1 {
                        print("passage \(currentPlayerNumber + 1 )")
                        message.gameStop.toggle()
                    }
                    alert = true
                    currentPlayerNumber -= 1

                }
            }

        } else {
            players[currentPlayerNumber].consecutiveZeroCount = 0
            players[currentPlayerNumber].score += scoreJoueur

            if  players[currentPlayerNumber].score > 50 {
               // if isOn[1] {
                    players[currentPlayerNumber].score = 25
                    message.message = "\(players[currentPlayerNumber].name), score de 50 dépassé retour à 25 😢"
                    alert = true
                // }
            } else if players[currentPlayerNumber].score == 50 {
                alert = true
                message.message = "Bravo \(players[currentPlayerNumber].name), c'est gagné 🥳"
                message.gameStop.toggle()
                players[currentPlayerNumber].winner = true
            }
        }

        if currentPlayerNumber + 1 == players.count {

            currentPlayerNumber = 0
            tourCounter += 1
        } else {
            currentPlayerNumber += 1
        }

    }

    func exportPlayer() -> [Player] {

            var joueurExport = players
            for joueur in listeJoueurElimine {
                joueurExport.append(joueur)
            }

            return joueurExport.sorted { joueur1, joueur2 in
                 joueur1.score > joueur2.score
            }

    }

    func test () -> [Player] {

        players[0].score = 8
        players[1].score = 45
        players[1].eliminate = true
        players[2].score = 50
        players[2].winner = true
        return exportPlayer()
    }
    func hash(into hasher: inout Hasher) {
        hasher = Hasher()
    }
}
