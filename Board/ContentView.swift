//
//  ContentView.swift
//  Board
//
//  Created by Chris Grant on 2024-05-05.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var phrase:Phrase
    @State var isErasePressed = false
    @State var isPhrasePressed = false
    @State var isDeletePressed = false
    
    var body: some View {
        VStack {
            Grid() {
                GridRow {
                    TouchTargetView(label: "A")
                    TouchTargetView(label: "B")
                    TouchTargetView(label: "C")
                    TouchTargetView(label: "D")
                    Color.clear
                    TouchTargetView(label: "Yes")       .font(.custom("George", size: 50))

                }
                GridRow {
                    TouchTargetView(label: "E")
                    TouchTargetView(label: "F")
                    TouchTargetView(label: "G")
                    TouchTargetView(label: "H")
                    Color.clear
                    TouchTargetView(label: "No")            .font(.custom("George", size: 50))

                }
                GridRow {
                    TouchTargetView(label: "I")
                    TouchTargetView(label: "J")
                    TouchTargetView(label: "K")
                    TouchTargetView(label: "L")
                    TouchTargetView(label: "M")
                    TouchTargetView(label: "N")
                }
                GridRow {
                    TouchTargetView(label: "O")
                    TouchTargetView(label: "P")
                    TouchTargetView(label: "Q")
                    TouchTargetView(label: "R")
                    TouchTargetView(label: "S")
                    TouchTargetView(label: "T")
                }
                GridRow {
                    TouchTargetView(label: "U")
                    TouchTargetView(label: "V")
                    TouchTargetView(label: "W")
                    TouchTargetView(label: "X")
                    TouchTargetView(label: "Y")
                    TouchTargetView(label: "Z")
                }
            }
            .font(.custom("George", size: 75))
            .padding(.horizontal)

            HStack {
                    Image(systemName: "eraser.line.dashed")
                    .foregroundColor(isErasePressed ? .mint : .primary)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                isErasePressed.toggle()
                                phrase.content.removeAll()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeOut(duration: 1.0)) {
                                        isErasePressed.toggle()
                                    }
                                }

                            }
                        }
                
                Spacer()
                
                    Text(phrase.content)
                        .font(.custom("George", size: 50))
                        .foregroundColor(isPhrasePressed ? .mint : .primary)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                isPhrasePressed.toggle()
                                phrase.content.append(" ")
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeOut(duration: 1.0)) {
                                        isPhrasePressed.toggle()
                                    }
                                }

                            }
                        }
                
                Spacer()

                    Image(systemName: "delete.left")
                    .foregroundColor(isDeletePressed ? .mint : .primary)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                isDeletePressed.toggle()
                                phrase.content = String(phrase.content.dropLast())
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeOut(duration: 1.0)) {
                                        isDeletePressed.toggle()
                                    }
                                }

                            }
                        }
                
            }

        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Phrase())
}
