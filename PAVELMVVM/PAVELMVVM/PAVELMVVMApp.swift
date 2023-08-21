//
//  PAVELMVVMApp.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 16/08/23.
//

import SwiftUI

@main
struct PAVELMVVMApp: App {
    // MARK: Properties
    @State var path: [Screen] = []
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView(path: $path)
                
        }
    }
}
