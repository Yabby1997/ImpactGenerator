//
//  ContentView.swift
//  ImpactGenerator
//
//  Created by Seunghun on 7/20/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Picker("", selection: $viewModel.feedbackType) {
                ForEach(FeedbackType.allCases) { feedbackType in
                    Text(feedbackType.rawValue).tag(feedbackType)
                }
            }
            .pickerStyle(.segmented)
            Slider(value: $viewModel.intensity, in: 0.0...1.0, label: {})
        }
        .padding()
    }
}
