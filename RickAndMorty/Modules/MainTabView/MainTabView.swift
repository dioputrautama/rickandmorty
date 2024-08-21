//
//  MainTabView.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 20/08/24.
//

import SwiftUI
import Combine

class TabBarVisibility: ObservableObject {
    static let shared = TabBarVisibility()
    @Published var isHideTabBar: Bool = false
}

struct MainTabView: View {
    @State private var selectedTab: TabType = .home
    @StateObject private var tabBarVisibility = TabBarVisibility.shared

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    ExploreView()
                case .puzzle:
                    HomeView()
                }
            }

            if !tabBarVisibility.isHideTabBar {
                VStack() {
                    Spacer()
                    CustomTabBarView(selectedTab: $selectedTab)
                        .padding(.horizontal, 32)
                }
                .zIndex(1)
            }
        }
    }
}

#Preview {
    MainTabView()
}
