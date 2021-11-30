//
//  TimersViewModel.swift
//  FitnessTimer
//
//  Created by AlecNipp on 11/20/21.
//

import Foundation
import SwiftUI

class TimerCardsViewModel: ObservableObject {
    @Published var timerCards: [TimerCardModel]
    init() {
        timerCards = [TimerCardModel(timer: TimerModel(restTime: 90, startColor: Color.green, endColor: Color.blue), label: "Example")]
    }
    func addTimerCard(timerCard: TimerCardModel) {
        timerCards.append(timerCard)
    }
}
