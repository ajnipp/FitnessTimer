//
//  ContentView.swift
//  Shared
//
//  Created by AlecNipp on 11/19/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TimersViewModel()
    let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.timers, id: \.id) { item in
                        TimerView()
                    }
                }
                .padding()
                .navigationTitle(Text("Rest Timer"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.addTimer(timer: TimerModel(restTime:90))
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

