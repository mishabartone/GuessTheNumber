//
//  AppStates.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 07.02.2023.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var moveToDashboard: Bool = false
}
