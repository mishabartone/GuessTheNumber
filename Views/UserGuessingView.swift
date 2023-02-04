//
//  UserGuessingView.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 04.02.2023.
//

import SwiftUI
import Combine

struct UserGuessingView: View {
    
    @State var strNumber = ""
    @State var areYouWinningSon = ""
    @EnvironmentObject var model : GuessTheNumberModel
    @State private var hideNextButton = true
    
    var body: some View {
        VStack{
            Text(areYouWinningSon)
            Text("\(model.cpuNumber)")
            Text("User attempts: \(model.usrAttempts)")
                .padding(.vertical, 2)
            Spacer()
            Text("Your turn\nTry to guess the number from 1 to 10")
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
            TextField("And put it here", text: $strNumber)
                .padding(.horizontal)
                .keyboardType(.numberPad)
                .onReceive(Just(strNumber)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.strNumber = filtered
                    }
                }
                .multilineTextAlignment(.center)
            Spacer()
            ZStack{
                Button("Am i guessed?") {
                    model.usrAttempts += 1
                    let usrNumber = Int(strNumber)
                    if model.cpuNumber == usrNumber {
                        areYouWinningSon = "You win!"
                        hideNextButton = false
                    } else {
                        areYouWinningSon = usrNumber! > model.cpuNumber ? "Its less" : "Its more"
                    }
                }
                .isHidden(!hideNextButton)
                .grayButton()
                .padding()
                NavigationLink(destination: ResultView()) {
                    Text("I guessed a number!")
                }
                .grayButton()
                .isHidden(hideNextButton)
            }
        }
    }
}

struct UserGuessingView_Previews: PreviewProvider {
    static var previews: some View {
        UserGuessingView()
            .environmentObject(GuessTheNumberModel())
    }
}
