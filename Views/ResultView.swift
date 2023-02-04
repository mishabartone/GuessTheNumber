//
//  ResultView.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 04.02.2023.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var model : GuessTheNumberModel
    
    var result: String {
        get {
            if model.cpuAttempts == model.usrAttempts {
                return "Its draw"
            } else if model.cpuAttempts > model.usrAttempts {
                return "You are winning, Son!"
            } else {
                return"You lose!"
            }
        }
    }
    
    var body: some View {
        VStack{
            Text(result)
            Text("CPU attempts: \(model.cpuAttempts), User attempts: \(model.usrAttempts)")
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(GuessTheNumberModel())
    }
}
