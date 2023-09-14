//
//  Coffee_TrackerApp.swift
//  Coffee Tracker
//
//  Created by Clem OJ on 14/09/2023.
//

import SwiftUI

@main
struct Coffee_TrackerApp: App {
    
    @State private var coffeeController = CoffeeController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, coffeeController.container.viewContext)
        }
    }
}
