//
//  watchConnector.swift
//  molky2
//
//  Created by Ezequiel Gomes on 21/02/2024.
//

import Foundation
import WatchConnectivity

class WatchConnector: NSObject, WCSessionDelegate {

    var session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()

    }

    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }
    func sendtoWatch( nomJoueur: [String], isOne: Bool) {

    if session.isReachable {
            session.sendMessage(["joueur": nomJoueur, "istrue": isOne], replyHandler: nil)
            //            do {
            //                session.sendMessage(["joueur": joueur, "istrue" : [true,true]]) { error in
            //                    print(error)
            //                }
            //                let data =  try NSKeyedArchiver.archivedData(withRootObject: gameBrain, requiringSecureCoding: false)
            //                session.sendMessageData(data) { Error in
            //                    print ( "\(Error)" )
        }
        // }

        //            catch {
        //                print("Error archiving data: \(error.localizedDescription) ")
        // }

        // }
        else {
            print("aucune Apple watch trouvée")
        }
    }

}
