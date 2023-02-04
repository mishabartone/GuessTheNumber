//
//  GuessTheNumberView.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 03.02.2023.
//

import SwiftUI

struct GuessTheNumberView: View {
    var body: some View {
        VStack {
            Text("Now you need to guess any number from 1 to 10")
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
            NavigationLink(destination: ComputerGuessingView()) {
                Text("I guessed a number!")
            }
            .grayButton()

        }
    }
}

struct GuessTheNumberView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuessTheNumberView()
        }
    }
}
