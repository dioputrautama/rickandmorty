//
//  ExploreView.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 20/08/24.
//

import SwiftUI

struct ExploreEntity {
    let image: String
}

struct ExploreView: View {
    var totalItemInRow = 3
    let data: [ExploreEntity] = [ExploreEntity(image: Assets.Image.dummy), ExploreEntity(image: Assets.Image.dummy), ExploreEntity(image: Assets.Image.dummy), ExploreEntity(image: Assets.Image.dummy), ExploreEntity(image: Assets.Image.dummy)]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Colors.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        ForEach(data.indices, id: \.self) { index in
                            let item = data[index]
                            LayoutTop(screenWidth: geometry.size.width, data: data, totalItemInRow: totalItemInRow)
                        }
                    }
                    .background(.red)
                }
            }
        }
    }
}

struct LayoutTop: View {
    let screenWidth: CGFloat
    let data: [ExploreEntity]
    let totalItemInRow: Int

    var body: some View {
        let width = screenWidth / 3
        return HStack {
            ForEach(data.indices, id: \.self) { index in
                let item = data[index]
                Image(item.image)
                    .resizable()
                    .frame(width: width, height: width)
                    .scaledToFill()
            }
        }
        .background(.red)
        .frame(width: screenWidth, height: width)
    }
}

#Preview {
    ExploreView()
}
