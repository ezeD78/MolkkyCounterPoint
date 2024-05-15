//
//  MolkyGrid.swift
//  molky2
//
//  Created by Ezequiel Gomes on 08/02/2024.
//

import SwiftUI

struct MolkyGrid: View {
    @StateObject var molkyGridControler: MolkyGridController
    @Binding var currentScore: Int
    var ismodern: Bool?
     @State private var nomImage = "0.circle.fill"

    @State var scoreEncoursTempo = 0
    var body: some View {
        if ismodern ?? false {
            LazyVGrid(columns: [ GridItem(), GridItem(), GridItem()]) {
                    ForEach(molkyGridControler.nomImage.indices, id: \.self) { index in
                        Button(action: {
                            molkyGridControler.updateImage(numeroImage: index, ismodern: ismodern)
                            currentScore = molkyGridControler.scoreEncours
                            nomImage = "0.circle"
                        }, label: {

                            Image(systemName: molkyGridControler.nomImage[index]).resizable().scaledToFit().padding(.horizontal)
                        })
                    }
                Spacer()
                Button(action: {
                    molkyGridControler.reset()
                    currentScore = molkyGridControler.scoreEncours
                    nomImage = nomImage == "0.circle.fill" ? "0.circle" : "0.circle.fill"
                }, label: {

                    Image(systemName: nomImage).resizable().scaledToFit().padding(.horizontal)
                })
            }.frame(height: 270)

        } else {
            VStack {
                HStack {
                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 6, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {

                        Image(systemName: molkyGridControler.nomImage[6]).resizable().scaledToFit()
                    })
                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 8, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours

                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[8]).resizable().scaledToFit()
                    })

                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 7, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[7]).resizable().scaledToFit()
                    })

                }
                HStack {

                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 4, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[4]).resizable().scaledToFit()
                    })
                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 10, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[10]).resizable().scaledToFit()
                    })

                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 11, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[11]).resizable().scaledToFit()
                    })
                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 5, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[5]).resizable().scaledToFit()
                    })

                }
                HStack {

                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 2, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[2]).resizable().scaledToFit()
                    })
                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 9, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[9]).resizable().scaledToFit()
                    })

                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 3, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[3]).resizable().scaledToFit()
                    })

                }
                HStack {

                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 0, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[0]).resizable().scaledToFit()
                    })
                    Button(action: {
                        molkyGridControler.updateImage(numeroImage: 1, ismodern: ismodern)
                        currentScore = molkyGridControler.scoreEncours
                    }, label: {
                        Image(systemName: molkyGridControler.nomImage[1]).resizable().scaledToFit()
                    })

                }
            }.frame(height: 340)
        }

    }

}
