//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 15/08/24.
//

import SwiftUI

struct HomeView: View {
    private let gridItems = [GridItem(.adaptive(minimum: 110))]

    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(0...20, id: \.self) { _ in
                        CharacterCardView()
                    }
                }
                .padding(.all, 16)
            }
        }
    }
}

#Preview {
    HomeView()
}

struct CharacterCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(Assets.Image.dummy)
                .cornerRadius(8)

            Text("Rick Sanchez")
                .font(Typography.size14Bold)
                .foregroundStyle(Colors.white)

            VStack(alignment: .leading, spacing: 6) {
                makeIconAndLabel(icon: Assets.Icons.alien, title: "Human")

                makeIconAndLabel(icon: Assets.Icons.planet, title: "Earth (C-137)")
            }
        }
        .padding(.all, 8)
        .background(Colors.shark)
        .cornerRadius(8)
    }

    private func makeIconAndLabel(icon: String, title: String) -> some View {
        return HStack(spacing: 4) {
            Image(icon)
                .resizable()
                .frame(width: 14, height: 14)

            Text(title)
                .font(Typography.size12)
                .foregroundStyle(Colors.white)
        }
    }
}
