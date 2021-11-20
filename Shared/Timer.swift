//
//  Timer.swift
//  FitnessTimer
//
//  Created by AlecNipp on 11/19/21.
//

import SwiftUI

struct TimerView: View {
    let restTime: Int
    @State var progressTime = 0
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var colorProgress: Double {
        if progressTime == 0 {
            return 0.0
        }
        else if progressTime > restTime {
            return 1.0
        }
        return Double(progressTime) / Double(restTime)
    }
    var hours: Int {
        progressTime / 3600
    }
    var minutes: Int {
        (progressTime % 3600) / 60
    }
    
    var seconds: Int {
        progressTime % 60
    }
    
    var blueness: Double {
        1 - colorProgress
    }
    var greenness: Double {
        colorProgress
    }
    var body: some View {
        Button(action: {
            print(colorProgress)
            withAnimation(.default) {
                progressTime = 0
            }
        },label: {
            Text("\(String(format: "%02d:%02d:%02d", hours, minutes, seconds))")
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: 150, height: 150)
                .background(Color(red: 0.0, green: greenness, blue: blueness))
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .onReceive(timer) { _ in
                    progressTime += 1
                }
        })
            .padding()


    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(restTime: 90)
    }
}
