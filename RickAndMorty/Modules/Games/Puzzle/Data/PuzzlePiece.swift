//
//  PuzzlePiece.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 14/10/24.
//

import SwiftUI

class PuzzlePiece: Identifiable, ObservableObject {
    let id = UUID()
    let image: Image
    var correctPosition: Int
    var currentPosition: Int
    @Published var offset = CGSize.zero
    @Published var dragOffset = CGSize.zero

    init(image: Image, correctPosition: Int = 0, currentPosition: Int = 0) {
        self.image = image
        self.correctPosition = correctPosition
        self.currentPosition = currentPosition
    }
}
