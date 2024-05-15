//
//  WatchToIos.swift
//  MolkkyWatch Watch App
//
//  Created by Ezequiel Gomes on 21/02/2024.
//

import Foundation

import WatchConnectivity

class WatchToIos: NSObject, WCSessionDelegate, ObservableObject {

    var session: WCSession
    @Published var gameBrain = GameBrain()
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        DispatchQueue.main.async {
            session.delegate = self
            session.activate()
        }

    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let joueurNom = message["joueur"] as? [String] {
                let isOn = message["istrue"] as? Bool
                self.gameBrain = GameBrain(nomJoueurs: joueurNom, isOne: isOn!)

        }
        }

        //     func session(_ session: WCSession, didReceiveMessage message: Data) {
        ////        do {
        //            print("eee")
        ////            if let receivedObject = try NSKeyedUnarchiver.unarchivedObject(ofClass: GameBrain.self, from: message){
        ////                print(message )
        ////                self.message = receivedObject.joueurs[0].nom
        ////            }
        ////
        ////
        ////                if let receivedObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(message) as? GameBrain {
        ////                    self.message = receivedObject.joueurs[0].nom
        ////                } else {
        ////                    print("Erreur lors du désarchivage des données ou type non conforme")
        ////                }
        ////            } catch {
        ////                print("Erreur lors du désarchivage des données : \(error.localizedDescription)")
        ////            }
        //    }

    }
}
