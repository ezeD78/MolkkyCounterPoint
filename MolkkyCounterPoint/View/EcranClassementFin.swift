//
//  SwiftUIView.swift
//  molky2
//
//  Created by Ezequiel Gomes on 09/02/2024.
//

import SwiftUI

struct EcranClassementFin: View {
    @Environment(\.dismiss) var dismiss
    var findujeux: Bool
    var joueurs: [Player]
    var couleurs = [Color("Color11"), Color("Color12"), Color("Color13")]

    var body: some View {

        VStack {
            if findujeux {
                Text("Bravo \( joueurs[0].name) ! 👏🚀").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding().foregroundStyle(couleurs[0])
            } else {
                Spacer(minLength: 2)
            }

            VStack {
                ForEach(joueurs, id: \.self) { joueur in
                    HStack {

                        if joueur.winner {
                            Text(joueur.name).foregroundStyle(couleurs[0]).bold()
                            Spacer()
                            Image(systemName: "crown").foregroundColor(couleurs[0]).bold()
                            Text("\(joueur.score)").foregroundStyle(couleurs[0]).bold()
                        } else if joueur.eliminate {
                            Text(joueur.name).foregroundStyle(couleurs[1])
                            Spacer()
                            Image(systemName: "xmark").foregroundColor(couleurs[1]).bold()
                            Text("\(joueur.score)").foregroundStyle(couleurs[1])
                        } else {
                            Text(joueur.name)
                            Spacer()
                            Text("\(joueur.score)")
                        }

                    }.padding()

                                }

            }.background(couleurs[2])
            if findujeux {
                HStack {
                    NavigationLink(destination: {
                        PageDemarrage()
                    }, label: {
                        Text("Recommencer")
                    }).padding()

//                    NavigationLink(destination: {
//                        EcranDejeux(gameBrain: GameBrain(joueurs: joueurs))
//                    }, label: {
//                        Text("Prendre sa revanche ")
//                    }).padding()

                }
            } else {
                Button("Fermer") {
                    dismiss()

                }
            }

            Spacer()
            .navigationTitle("Scores : ")
            .navigationBarBackButtonHidden(true)
        }

    }
}

#Preview {

    EcranClassementFin(findujeux: false, joueurs: GameBrain(nomJoueurs: ["Franck", "David", "Marc"], isOne: true).test())
}
