//
//  BoardApp.swift
//  Board
//
//  Created by Chris Grant on 2024-05-05.
//

import SwiftUI

@main
struct BoardApp: App {
    @StateObject var phrase = Phrase()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(phrase)
        }
    }
}
