//
//  RamadanApp.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 17/3/22.
//

import SwiftUI

@main
struct RamadanApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            LaunchingScreen()
                .environmentObject(network)
        }
    }
}
