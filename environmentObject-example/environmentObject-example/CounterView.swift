//
//  ContentView.swift
//  environmentObject-example
//
//  Created by huda elhady on 20/06/2024.
//

import SwiftUI

struct CounterView: View {
    @StateObject var numberManager = NumberManager()
    
    var body: some View {
        VStack {
            RedView()
                .padding()
            
            Button("Generate number"){
                numberManager.counter += 1
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            
            BlueView()
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .environmentObject(numberManager)
    }
}

#Preview {
    CounterView()
}

struct BlueView: View {
    var body: some View {
        VStack {
            Text("BlueView doesn't need to know about NumberManager")
                .padding()
                .foregroundColor(.white)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            RedView()
                .padding()
        }
        .padding()
        .background(Color.blue)
    }
}

struct RedView: View {
    @EnvironmentObject var numberManager: NumberManager
    
    var body: some View {
        VStack {
            Text("\(numberManager.counter)")
                .padding()
                .foregroundColor(.white)
                .font(.title)
        }
        .background(Color.red)
    }
}
