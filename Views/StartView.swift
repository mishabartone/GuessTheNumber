//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 03.02.2023.
//

import SwiftUI

struct StartView: View {
    
    @StateObject var model : GuessTheNumberViewModel = GuessTheNumberViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Image("numbersBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(1.0)
                    
                    NavigationLink(destination: GuessTheNumberView()) {
                        Text("Play \"Guess the numbers\"")
                    }
                                   .buttonStyle(.borderedProminent)
                                   .controlSize(.large)
                                   .tint(.black)
                }
                
            }
        }
        .environmentObject(model)
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
