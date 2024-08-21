//
//  CustomTabView.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 20/08/24.
//

import SwiftUI

enum TabType: String, CaseIterable {
    case home
    case explore
    case puzzle

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .explore:
            return "Explore"
        case .puzzle:
            return "Puzzle"
        }
    }

    var iconNormal: String {
        switch self {
        case .home:
            return "house"
        case .explore:
            return "globe.asia.australia"
        case .puzzle:
            return "puzzlepiece"
        }
    }

    var iconFilled: String {
        return iconNormal + ".fill"
    }
}

struct CustomTabBarView: View {
    @Binding var selectedTab: TabType

    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 60)

            HStack {
                ForEach(TabType.allCases, id: \.rawValue) { item in
                    Spacer()
                    Button {
                        selectedTab = item
                    } label: {
                        VStack(spacing: 2) {
                            Image(systemName: selectedTab == item ? item.iconFilled : item.iconNormal)
                                .scaleEffect(selectedTab == item ? 1.15 : 1.0)
                                .foregroundColor(selectedTab == item ? Colors.mainBlue : Colors.gray)
                            Text(item.title)
                                .foregroundColor(selectedTab == item ? Colors.mainBlue : Colors.gray)
                                .font(selectedTab == item ? Typography.size12Bold : Typography.size12)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
