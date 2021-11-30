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
                ZStack {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.timerCards, id: \.id) { item in
                            TimerCardView(model: item)
                        }
                    }
                    //                .padding()
                    .navigationTitle(Text("MulTimer"))
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
}

// TODO: Add hours, minutes, seconds pickers and their respective variables. Then add a method that computes the seconds value of the timer.

struct AddButtonSheetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: TimerCardsViewModel
    @State var label = ""
    @State var hours = 0
    @State var minutes = 0
    @State var seconds = 50
    @State var startColor = Color.blue
    @State var endColor = Color.green
    
    var body: some View {
        VStack{
            HStack{
                Picker("Hours", selection: $hours) {
                    ForEach(0 ..< 24) {
                        Text("\($0) hours")
                    }
                }
                Picker("Minutes", selection: $minutes) {
                    ForEach(0 ..< 60) {
                        Text("\($0) minutes")
                    }
                }
                Picker("Seconds", selection: $seconds) {
                    ForEach(0 ..< 60) {
                        Text("\($0) seconds")
                    }
                }
            }
            //            Form {
            //                Section {
            TextField("Timer title", text: $label)
            //                }
            //                Section{
            ColorPicker("Set the start color", selection: $startColor, supportsOpacity: false)
            ColorPicker("Set the end color", selection: $endColor, supportsOpacity: false)
            //                }
            Button("Confirm") {
                viewModel.addTimerCard(timerCard: TimerCardModel(timer: TimerModel(restTime: restTime, startColor: startColor, endColor: endColor), label: label))
                dismiss()
            }
            .font(.title3)
            .buttonStyle(.bordered)
            .padding()
        }
    }
    
    
    
    
    var restTime: Int {
        (hours * 3600) + (minutes * 60) + seconds
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

