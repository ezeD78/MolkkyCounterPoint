//
//  EcranJeuxWatch.swift
//  MolkkyWatch Watch App
//
//  Created by Ezequiel Gomes on 11/03/2024.
//

import SwiftUI

struct EcranJeuxWatch: View {
    @StateObject var gameBrain: GameBrain
    @State var scoreEnCours = 0
    @State var showEcranClassementFin = false
    @State var showEcranClassementEnCours = false
    var body: some View {

        VStack {
            HStack {
                Button(action: {
                    showEcranClassementEnCours.toggle()
                }, label: {
                    Image(systemName: "list.star")
            }).frame(width: 25, height: 20).buttonStyle(.borderless).foregroundColor(.white)
           Spacer()
            }.padding()

            Text("Tour n° \(gameBrain.tourCounter+1), \( gameBrain.players[gameBrain.currentPlayerNumber].name) ").padding(.bottom)

            Picker(selection: $scoreEnCours, label: Text("Score:")) {
                ForEach( 0 ..< 13) { index in
                    Text("\(index)").tag(index)
                }

            }
            Button("valider") {
                withAnimation {
                    gameBrain.valideTourJoueur(scoreJoueur: scoreEnCours)
                    scoreEnCours = 0
                }

            }.padding()
        }.ignoresSafeArea().sheet(isPresented: $showEcranClassementEnCours, content: {
            EcranClassementFinWatch(gameStop: gameBrain.message.gameStop, players: gameBrain.exportPlayer())
        }).navigationDestination(isPresented: $showEcranClassementFin, destination: {
            EcranClassementFinWatch(gameStop: gameBrain.message.gameStop, players: gameBrain.exportPlayer())
        }).navigationBarBackButtonHidden().alert(gameBrain.message.message, isPresented: $gameBrain.alert) {
            Button("OK") {
                if gameBrain.message.gameStop {
                    print("test")
                    showEcranClassementFin.toggle()
                }
            }

        }
    }

}
#Preview {
    EcranJeuxWatch(gameBrain: GameBrain(nomJoueurs: ["Jakie", "David"], isOne: true))
}
