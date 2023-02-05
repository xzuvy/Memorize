//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Peter Clarke on 02.02.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
