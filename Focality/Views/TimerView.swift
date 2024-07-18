//
//  ContentView.swift
//  Timer
//
//  Created by Apprenant 123 on 11/07/2024.
//

import SwiftUI

struct TimerView: View {
    @State private var showModal = false
    
    var body: some View {
        VStack {
            ZStack {
                Ellipse()
                    .stroke(.primaire, lineWidth: 4)
                    .fill(.white)
                .frame(width: 227, height: 227)
                VStack {
                    Text("25:00")
                        .foregroundStyle(.primaire)
                    Text("Lecture")
                        .foregroundStyle(.primaire)
                }
            }
            Spacer()
            HStack {
                ZStack {
                    Ellipse()
                    .fill(.primaire)
                    .frame(width: 54, height: 54)
                    Image("Button Play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .padding(.leading,5)
                }
                Image("Skip Forward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 25.26)
            }
            Spacer()
            HStack {
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
            }
            Spacer()
            Text("Focus Time")
                .font(.largeTitle)
                .foregroundStyle(.primaire)
                .frame(width: 174, height: 39)
            Spacer()
            ZStack {
                Ellipse()
                    .fill(.primaire)
                .frame(width: 40, height: 40)
                Image("Button Setting")
            }
            Spacer()
        }
    }
}

#Preview {
    TimerView()
}
