//
//  ContentView.swift
//  molky2
//
//  Created by Ezequiel Gomes on 09/01/2024.
//

import SwiftUI

struct PageDemarrage: View {

    @State var nbJoueur = 2
    @State var isOn = true
    @State var grilleClassique = true
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.85, green: 0.58, blue: 1).opacity(0.4).ignoresSafeArea()
                VStack(spacing: 20 ) {
            Spacer()
                    Text("Combien de personnes vont jouer ?  ")
                    withAnimation {
                        Stepper("\(nbJoueur)", value: $nbJoueur, in: 2 ... 10 ).padding()
                    }

                    Toggle(isOn: $isOn) {
                        Text("Éliminer le joueur après 3 lancer nul ?")
                    }
                    Toggle(isOn: $grilleClassique) {
                        Text("Grille classique ?  ")
                    }
//                    Toggle(isOn: $isOn[1]) {
//                        Text("Revenir à 25 quand le joueur dépasse 50 ? ")
//                    }
                    Spacer()
                    NavigationLink(value: nbJoueur, label: {
                        Text("Suivant")
                    }).buttonStyle(.borderedProminent)
                    .navigationTitle("MOLKKY")
                    .navigationDestination(for: Int.self) { joueurs in
                        InscriptionDesParticipant(nbjoueur: joueurs, isOn: isOn, ismodern: !grilleClassique)
                    }
                }.padding()
            }

        }

    }
}

#Preview {
    PageDemarrage()
}
