//
//  KPSSPuanHesaplamaApp.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 31.01.2024.
//

import SwiftUI

@main
struct KPSSPuanHesaplamaApp: App {
    init() {
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearanceTab
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
    }
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for:Result.self)
    }
}
