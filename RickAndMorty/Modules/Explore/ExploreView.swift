//
//  ExploreView.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 20/08/24.
//

import SwiftUI

struct ExploreView: View {
    private let totalItemInRow = 3
    let spacing: CGFloat = 2
    let data: [[ExploreEntity]]

    init() {
        let exploreData = ExploreEntity.dummyData()
        var result = [[ExploreEntity]]()
        var tmp = [ExploreEntity]()

        for datum in exploreData {
            tmp.append(datum)
            if tmp.count == 3 {
                result.append(tmp)
                tmp.removeAll()
            }
        }

        if !tmp.isEmpty {
            result.append(tmp)
        }

        data = result
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Colors.background
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: spacing) {
                        ForEach(data.indices, id: \.self) { index in
                            let item = data[index]
                            if index % 3 != 2 {
                                LayoutTop(screenWidth: geometry.size.width, data: item, totalItemInRow: totalItemInRow, spacing: spacing)
                            } else {
                                if index % 2 == 0 {
                                    LayoutCenter(position: .left, screenWidth: geometry.size.width, data: item, totalItemInRow: totalItemInRow, spacing: spacing)
                                } else {
                                    LayoutCenter(position: .right, screenWidth: geometry.size.width, data: item, totalItemInRow: totalItemInRow, spacing: spacing)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct LayoutTop: View {
    let screenWidth: CGFloat
    let data: [ExploreEntity]
    let totalItemInRow: Int
    let spacing: CGFloat

    var body: some View {
        let width = screenWidth / 3
        return HStack(spacing: spacing) {
            ForEach(data.indices, id: \.self) { index in
                let item = data[index]
                Image(item.image)
                    .resizable()
                    .frame(width: width, height: width)
                    .scaledToFill()
            }
        }
    }
}

enum LayoutCenterPosition {
    case left
    case right
}

struct LayoutCenter: View {
    let position: LayoutCenterPosition
    let screenWidth: CGFloat
    let data: [ExploreEntity]
    let totalItemInRow: Int
    let spacing: CGFloat

    var body: some View {
        let width = screenWidth / 3
        return HStack(spacing: spacing) {
            if position == .left {
                Image(data[0].image)
                    .resizable()
                    .frame(width: width * 2 + spacing, height: width * 2 + spacing)
                    .scaledToFill()
            }

            VStack(spacing: spacing) {
                Image(data[1].image)
                    .resizable()
                    .frame(width: width, height: width)
                    .scaledToFill()

                Image(data[2].image)
                    .resizable()
                    .frame(width: width, height: width)
                    .scaledToFill()
            }

            if position == .right {
                Image(data[0].image)
                    .resizable()
                    .frame(width: width * 2, height: width * 2)
                    .scaledToFill()
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewInterfaceOrientation(.portrait)
    }
}

