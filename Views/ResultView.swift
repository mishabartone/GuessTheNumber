//
//  ResultView.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 04.02.2023.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var viewModel : GuessTheNumberViewModel
    @Environment(\.presentationMode) var presentation
    
    var result: String {
        get {
            if viewModel.gtn.cpuAttempts == viewModel.gtn.usrAttempts {
                return "Its draw"
            } else if viewModel.gtn.cpuAttempts > viewModel.gtn.usrAttempts {
                return "You are winning, Son!"
            } else {
                return"You lose!"
            }
        }
    }
    
    var body: some View {
        VStack{
            Text(result)
            Text("CPU attempts: \(viewModel.gtn.cpuAttempts), User attempts: \(viewModel.gtn.usrAttempts)")
            Button (action: {
                NavigationUtil.popToRootView()
                viewModel.restart()
            } ){
                Text("Play again!")
            }
            .grayButton()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(GuessTheNumberViewModel())
    }
}
