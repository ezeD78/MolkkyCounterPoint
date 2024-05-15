//
//  EcranClassementFinWatch.swift
//  MolkkyWatch Watch App
//
//  Created by Ezequiel Gomes on 11/03/2024.
//

import SwiftUI

struct EcranClassementFinWatch: View {

    var gameStop: Bool
    var players: [Player]
    var colors = [Color("Color11"), Color("Color12"), Color("Color13")]

    var body: some View {

        ScrollView {
            ForEach(players, id: \.self) { joueur in
                HStack {

                    if joueur.winner {
                        Text(joueur.name).foregroundStyle(colors[0]).bold()
                        Spacer()
                        Image(systemName: "crown").foregroundColor(colors[0]).bold()
                        Text("\(joueur.score)").foregroundStyle(colors[0]).bold()
                    } else if joueur.eliminate {
                        Text(joueur.name).foregroundStyle(colors[1])
                        Spacer()
                        Image(systemName: "xmark").foregroundColor(colors[1]).bold()
                        Text("\(joueur.score)").foregroundStyle(colors[1])
                    } else {
                        Text(joueur.name)
                        Spacer()
                        Text("\(joueur.score)")
                    }

                }.padding()

            }

            if gameStop {
                NavigationLink(destination: {
                    EcranJeuxWatch(gameBrain: GameBrain(joueurs: players))
                }, label: {
                    Text("Revanche")
                }).padding()
            }

        }

        Spacer()
            .navigationTitle("Scores : ")
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EcranClassementFinWatch(gameStop: true, players: GameBrain(nomJoueurs: ["Franck", "David", "Marc", "Jacques"], isOne: true).test())
}
