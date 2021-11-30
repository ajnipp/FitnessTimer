//
//  TimerCardView.swift
//  FitnessTimer
//
//  Created by AlecNipp on 11/23/21.
//

import SwiftUI

// TODO: Add some kind of indicator that the time is up (Maybe make it shake with an animation, add an icon (bell?)
struct TimerCardView: View {
    let label: String
    let timerView: TimerView
    init(model: TimerCardModel) {
        timerView = TimerView(model: model.timer)
        self.label = ((model.label == "") ? " ": model.label)
    }
    var height: CGFloat {
        timerView.tileHeight + 140.0
    }
    var width: CGFloat {
        timerView.tileWidth + 40.0
    }
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color( red: 0.8, green: 0.8, blue: 0.8))
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            VStack{
                Text(label)
                    .font(.title2)
                timerView
                
                Spacer()
                    .frame(width: 1, height: 30)
            }
            .frame(width: width, height: height)
            
        }
        .frame(maxWidth: width, maxHeight: height)
//        .frame(width: width, height: height)
        .padding()
        .frame(maxWidth: width, maxHeight: height)
    }
}

struct TimerCardView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCardView(model: TimerCardModel(timer: TimerModel(restTime: 90, startColor: Color.green, endColor: Color.blue), label: ""))
    }
}
