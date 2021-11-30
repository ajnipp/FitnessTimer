//
//  ContentView.swift
//  Shared
//
//  Created by AlecNipp on 11/19/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @StateObject var viewModel = TimerCardsViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.timerCards, id: \.id) { item in
                        TimerCardView(model: item)
                    }
                }
                //                .padding()
                .navigationTitle(Text("Rest Timer"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingSheet.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingSheet) {
                    AddButtonSheetView(viewModel: viewModel)
                }
            }
            
        }
    }
}

// TODO: Add hours, minutes, seconds pickers and their respective variables. Then add a method that computes the seconds value of the timer.

struct AddButtonSheetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: TimerCardsViewModel
    @State var label = ""
    @State var restTime = 90
    @State var startColor = Color.blue
    @State var endColor = Color.green

    var body: some View {
        VStack {
            TextField("Timer title", text: $label)
            
            ColorPicker("Set the start color", selection: $startColor, supportsOpacity: false)
            ColorPicker("Set the end color", selection: $endColor, supportsOpacity: false)
            Button("Confirm") {
                viewModel.addTimerCard(timerCard: TimerCardModel(timer: TimerModel(restTime: 90, startColor: startColor, endColor: endColor), label: label))
                dismiss()
            }
            .font(.title)
            .padding()
            .background(Color.black)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

