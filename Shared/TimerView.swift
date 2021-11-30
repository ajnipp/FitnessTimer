//
//  Timer.swift
//  FitnessTimer
//
//  Created by AlecNipp on 11/19/21.
//

import SwiftUI

struct TimerView: View {
    let restTime: Int
    let startColor: Color
    let endColor: Color
    let tileWidth: CGFloat
    let tileHeight: CGFloat
    
    
    init(rest: Int, color1: Color, color2: Color, width: CGFloat, height: CGFloat){
        restTime = rest
        startColor = color1
        endColor = color2
        tileWidth = width
        tileHeight = height
    }
    init() {
        restTime = 90
        startColor = Color.blue
        endColor = Color.green
        tileWidth = 160.0
        tileHeight = 70.0
    }
    init(model: TimerModel) {
        restTime = model.restTime
        startColor = model.startColor
        endColor = model.endColor
        tileWidth = 160.0
        tileHeight = 70.0
    }
    
    @State var progressTime = 0
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var animationAmount = 0.0
    
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
    var isDoneAnimation: Bool {
        progressTime > restTime
    }
    var body: some View {
        Button(action: {
            print(colorProgress)
            animationAmount = 0.0
            withAnimation(.default) {
                progressTime = 0
            }
        },label: {
            ZStack {
                Rectangle()
                    .fill(endColor)
                    .frame(width: tileWidth, height: tileHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                Rectangle()
                    .fill(startColor)
                    .frame(width: tileWidth, height: tileHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .opacity(1 - colorProgress)
                
                Text("\(String(format: "%02d:%02d:%02d", hours, minutes, seconds))")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: tileWidth, height: tileHeight)
                    .background(Color(red: 0, green: 0, blue: 0, opacity: 0))
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .onReceive(timer) { _ in
                        progressTime += 1
                        if isDoneAnimation {
                            animationAmount = 5.0
                        }
                    }
            }
        })
            .offset(y: animationAmount)
            .animation(.default
                        .repeatForever(autoreverses: false), value: animationAmount
            )
            .padding()
        
        
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
