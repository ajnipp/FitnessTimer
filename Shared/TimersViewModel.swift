//
//  TimersViewModel.swift
//  FitnessTimer
//
//  Created by AlecNipp on 11/20/21.
//

import Foundation

class TimersViewModel: ObservableObject {
    @Published var timers: [TimerModel]
    init() {
        timers = [TimerModel(restTime: 90, label: "Example")]
    }
    func addTimer(timer: TimerModel) {
        timers.append(timer)
    }
}
