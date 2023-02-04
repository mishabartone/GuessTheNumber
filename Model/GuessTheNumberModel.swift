//
//  GuessTheNumberModel.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 04.02.2023.
//

import Foundation
import SwiftUI

@MainActor class GuessTheNumberModel: ObservableObject {
    @Published var cpuAttempts = 0
    @Published var usrAttempts = 0
    
    let cpuNumber = Int.random(in: 1...10)
}
