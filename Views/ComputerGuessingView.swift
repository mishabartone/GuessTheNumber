//
//  ComputerGuessingView.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 03.02.2023.
//

import SwiftUI

struct ComputerGuessingView: View {
   
    @State private var hideNextButton = true
    @EnvironmentObject var viewModel : GuessTheNumberViewModel
    
    var body: some View {
        
        VStack{
            Text(viewModel.cpuResult)
            Spacer()
            Text("CPU attempts: \(viewModel.gtn.cpuAttempts)")
                .padding(.vertical, 2)
            Text("The number is \(viewModel.cpuThink)?")
            Spacer()
            ZStack{
                HStack{
                    Button("It was more") {
                        viewModel.cpuThinkMore()
                    }
                    .grayButton()
                    
                    Button("Yes!") {
                        viewModel.cpuCorrect()
                        hideNextButton = false
                    }
                    .grayButton()
                    
                    Button("It was less") {
                        viewModel.cpuThinkLess()
                    }
                    .grayButton()
                }
                .isHidden(!hideNextButton)
                NavigationLink(destination: UserGuessingView()) {
                    Text("I guessed a number!")
                }
                .grayButton()
                .isHidden(hideNextButton)
            }
        }
    }
}

struct ComputerGuessingView_Previews: PreviewProvider {
    static var previews: some View {
        ComputerGuessingView()
            .environmentObject(GuessTheNumberViewModel())
    }
}
