//
//  GuessTheNumberModel.swift
//  GuessTheNumber
//
//  Created by Михаил Железовский on 04.02.2023.
//

import Foundation
import SwiftUI

class GuessTheNumberViewModel: ObservableObject {
    
    @Published var gtn : GuessTheNumberModel
    
    var cpuThink : Int = Int.random(in: 1...10)
    var cpuNumber: Int = Int.random(in: 1...10)
    var min : Int = 1
    var max : Int = 10
    var cpuResult : String = ""
    var usrResult : String = ""
    var hideUsrNextButton : Bool = true
    
    init(gtn: GuessTheNumberModel = GuessTheNumberModel(cpuAttempts: 0, usrAttempts: 0)) {
        self.gtn = gtn
    }
    
    func cpuThinkMore() {
        gtn.cpuAttempts += 1
        if cpuThink + 1 > 10 {
            cpuResult = "Error. It cant be more."
            toStart()
        }
        else {
            cpuResult = ""
            min = cpuThink + 1
            cpuThink = Int.random(in: min...max)
        }
    }
    
    func cpuCorrect() {
        gtn.cpuAttempts += 1
        cpuResult = "Yay!"
    }
    
    func cpuThinkLess() {
        gtn.cpuAttempts += 1
        if cpuThink - 1 < 1 {
            cpuResult = "Error. It cant be less."
            toStart()
        }
        else {
            cpuResult = ""
            max = cpuThink - 1
            cpuThink = Int.random(in: min...max)
        }
    }
    
    func checkUsrTry(usrNumber: Int?) {
        gtn.usrAttempts += 1
        
        if usrNumber == nil {
            usrResult = "You need to put your number"
            return
        }
        
        if cpuNumber == usrNumber {
            usrResult = "You win!"
            hideUsrNextButton = false
        } else {
            usrResult = usrNumber! > cpuNumber ? "Its less" : "Its more"
        }
    }
    
    func toStart() {
        min = 1
        max = 10
    }
    
    func restart() {
        self.gtn = GuessTheNumberModel(cpuAttempts: 0, usrAttempts: 0)
        self.cpuThink  = Int.random(in: 1...10)
        self.cpuNumber = Int.random(in: 1...10)
        self.min = 1
        self.max = 10
        self.cpuResult = ""
        self.usrResult = ""
        self.hideUsrNextButton = true
    }
}
