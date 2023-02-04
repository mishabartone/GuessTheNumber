//
//  ComputerGuessingView.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 03.02.2023.
//

import SwiftUI

struct ComputerGuessingView: View {
   
    
    @State private var min = 1
    @State private var max = 10
    @State private var number = Int.random(in: 1...10)
    @State private var resultString = ""
    @State private var hideNextButton = true
    @EnvironmentObject var model : GuessTheNumberModel
    
    var body: some View {
        
        VStack{
            Text(resultString)
            Spacer()
            Text("CPU attempts: \(model.cpuAttempts)")
                .padding(.vertical, 2)
            Text("The number is \(number)?")
            Spacer()
            ZStack{
                HStack{
                    Button("It was more") {
                        model.cpuAttempts += 1
                        if number + 1 > 10 {
                            resultString = "Error. It cant be more."
                            toStart()
                        }
                        else {
                            resultString = ""
                            min = number+1
                            number = Int.random(in:min...max)
                        }
                    }
                    .grayButton()
                    
                    Button("Yes!") {
                        model.cpuAttempts += 1
                        resultString = "Yay!"
                        hideNextButton = false
                    }
                    .grayButton()
                    
                    Button("It was less") {
                        model.cpuAttempts += 1
                        if number - 1 < 1 {
                            resultString = "Error. It cant be less."
                            toStart()
                        }
                        else {
                            resultString = ""
                            max = number - 1
                            number = Int.random(in:min...max)
                        }
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
    
    func toStart() {
        min = 1
        max = 10
    }
}

struct ComputerGuessingView_Previews: PreviewProvider {
    static var previews: some View {
        ComputerGuessingView()
            .environmentObject(GuessTheNumberModel())
    }
}
