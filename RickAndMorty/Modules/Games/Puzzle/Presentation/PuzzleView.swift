//
//  PuzzleView.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 11/10/24.
//

import SwiftUI

struct PuzzleView: View {
    @ObservedObject private var vm: PuzzleVM

    let columns: [GridItem]

    init(vm: PuzzleVM = PuzzleVM()) {
        self.vm = vm
        self.columns = Array(repeating: GridItem(.flexible()), count: vm.gridSize)
        guard let image = UIImage(named: "dummy") else { return }
        self.vm.createPuzzlePieces(from: image)
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach(vm.result) { piece in
                PuzzlePieceView(piece: piece)
            }
        }
        .padding()
    }
}

struct PuzzlePieceView: View {
    @ObservedObject var piece: PuzzlePiece

    var body: some View {
        piece.image
            .resizable()
            .scaledToFit()
            .offset(x: piece.offset.width + piece.dragOffset.width, y: piece.offset.height + piece.dragOffset.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        piece.dragOffset = value.translation
                    }
                    .onEnded { _ in
                        piece.offset.width += piece.dragOffset.width
                        piece.offset.height += piece.dragOffset.height
                        piece.dragOffset = .zero
                    }
            )
    }
}

#Preview {
    PuzzleView()
}
