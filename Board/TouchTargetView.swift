//
//  TouchTargetView.swift
//  Board
//
//  Created by Chris Grant on 2024-05-10.
//

import SwiftUI

struct TouchTargetView: View {
    @EnvironmentObject var phrase:Phrase
    @State private var isTapped = false
    
    var label: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.clear))
            Text(label)
                .fontWeight(isTapped ? .ultraLight : .regular)
                .foregroundColor(isTapped ? .mint : .primary)
                
    
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.2)) {
                isTapped.toggle()
                phrase.content.append(label)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeOut(duration: 1.0)) {
                        isTapped.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    TouchTargetView(label: "Preview")
        .environmentObject(Phrase())
}
