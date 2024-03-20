//
//  MainView.swift
//  testy
//
//  Created by user on 18/03/24.
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            LibraryView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            LibraryView()
                .tabItem {
                    Label("Your Library", systemImage: "menucard")
                }
        }
        .tint(.white)
    }
}

#Preview {
    MainView()
}
