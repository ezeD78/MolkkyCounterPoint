//
//  MolkyGridController.swift
//  molky2
//
//  Created by Ezequiel Gomes on 02/02/2024.
//

import Foundation

class MolkyGridController: ObservableObject {

    @Published var nomImage =
    ["1.circle", "2.circle", "3.circle", "4.circle", "5.circle", "6.circle", "7.circle", "8.circle", "9.circle", "10.circle", "11.circle", "12.circle"]
    var quilleValide = Array(repeating: false, count: 12)
    var scoreEncours = 0

    func updateImage(numeroImage: Int, ismodern: Bool? ) {
        if ismodern ?? false {
            reset()

            for index in 0 ... (numeroImage) {
                nomImage[index] = "\(nomImage[index]).fill"
            }

        } else {
            nomImage[numeroImage] = nomImage[numeroImage] == "\(numeroImage+1).circle.fill" ? "\(numeroImage+1).circle" : "\(nomImage[numeroImage]).fill"

        }
        calculScore(numeroImage: numeroImage, ismodern: nil)
    }

    func calculScore(numeroImage: Int, ismodern: Bool? ) {

        if ismodern ?? false {
            scoreEncours = numeroImage + 1
        } else {
            quilleValide[numeroImage] = !quilleValide[numeroImage]

            let nbQuilleValide = quilleValide.filter {$0}.count
            switch nbQuilleValide {
            case 0:
                scoreEncours = 0
            case 1:
                for index in 0 ... (quilleValide.count) - 1 {

                    if quilleValide[index] {
                        scoreEncours = index + 1
                        return
                    }
                }
            default:
                scoreEncours = nbQuilleValide
            }
        }

    }
    func reset() {
        quilleValide = Array(repeating: false, count: 12)
        scoreEncours = 0
        nomImage =
        ["1.circle", "2.circle", "3.circle", "4.circle", "5.circle", "6.circle", "7.circle", "8.circle", "9.circle", "10.circle", "11.circle", "12.circle"]

    }
}
