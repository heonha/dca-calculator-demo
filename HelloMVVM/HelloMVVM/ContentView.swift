//
//  ContentView.swift
//  HelloMVVM
//
//  Created by Heonjin Ha on 2023/04/14.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = CounterViewModel()

    var body: some View {
        VStack(spacing: 14) {
            Text("PREMIUM!")
                .foregroundColor(.init(uiColor: .systemRed))
                .font(.system(size: 30))
                .opacity(viewModel.premium ? 1 : 0)


            Text("\(viewModel.count)")

            Button {
                viewModel.increase()
            } label: {
                Text("Plus!")
            }

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
