//
//  TimerCardView.swift
//  FitnessTimer
//
//  Created by AlecNipp on 11/23/21.
//

import SwiftUI

struct TimerCardView: View {
    let label: String?
    let timer: TimerView
    var height: CGFloat {
        timer.tileHeight + 140.0
    }
    var width: CGFloat {
        timer.tileWidth + 40.0
    }
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color( red: 0.8, green: 0.8, blue: 0.8))
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            VStack{
                Text(label ?? " ")
                    .font(.title2)
                timer
                
                Spacer()
                    .frame(width: 1, height: 30)
            }
            .frame(width: width, height: height)
            
        }
        .frame(width: width, height: height)
        .padding()
    }
}

struct TimerCardView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCardView(label: "Example", timer: TimerView())
    }
}
