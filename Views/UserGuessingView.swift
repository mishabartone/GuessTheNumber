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
    @EnvironmentObject var viewModel : GuessTheNumberViewModel
    
    var body: some View {
        VStack{
            Text(viewModel.usrResult)
            //Text("\(viewModel.cpuNumber)")
            Text("User attempts: \(viewModel.gtn.usrAttempts)")
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
                    let usrNumber = Int(strNumber)
                    viewModel.checkUsrTry(usrNumber: usrNumber)
                }
                .isHidden(!viewModel.hideUsrNextButton)
                .grayButton()
                .padding()
                NavigationLink(destination: ResultView()) {
                    Text("I guessed a number!")
                }
                .grayButton()
                .isHidden(viewModel.hideUsrNextButton)
            }
        }
    }
}

struct UserGuessingView_Previews: PreviewProvider {
    static var previews: some View {
        UserGuessingView()
            .environmentObject(GuessTheNumberViewModel())
    }
}
