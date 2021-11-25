//
//  ContentView.swift
//  Shared
//
//  Created by AlecNipp on 11/19/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @StateObject var viewModel = TimersViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.timers, id: \.id) { item in
                        TimerCardView(label: nil, timer: TimerView())
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

struct AddButtonSheetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: TimersViewModel
    @State var label: String = ""

    var body: some View {
        VStack {
            TextField("Timer title", text: $label)
            Button("Confirm") {
                viewModel.addTimer(timer: TimerModel(restTime: 90, label: label))
                dismiss()
            }
            .font(.title)
            .padding()
            .background(Color.black)
        }

    }
}

enum TimerColor {
    case red, blue, green, white, black
    
    func toString() -> String {
        switch self {
        case .red:
            return "Red"
        case .blue:
            return "Blue"
        case .green:
            return "Green"
        case .white:
            return "White"
        case .black:
            return "Black"
        }
    }
    func getColor() -> Color {
        switch self {
        case .red:
            return Color.red
            
        case .blue:
            return Color.blue
            
        case .green:
            return Color.green
            
        case .white:
            return Color.white
            
        case .black:
            return Color.black
            
        }
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

