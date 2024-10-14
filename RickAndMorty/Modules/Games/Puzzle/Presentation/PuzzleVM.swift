//
//  PuzzleVM.swift
//  RickAndMorty
//
//  Created by Dio Putra Utama on 11/10/24.
//

import SwiftUI

class PuzzleVM: ObservableObject {
    @Published var result: [PuzzlePiece] = []

    var gridSize: Int = 4

    init() {}

    func createPuzzlePieces(from image: UIImage) {
        let puzzleImages = splitImageIntoPieces(image: image, rows: gridSize, columns: gridSize)
        var pieces = [PuzzlePiece]()

        for (index, puzzleImage) in puzzleImages.enumerated() {
            let piece = PuzzlePiece(
                image: Image(uiImage: puzzleImage),
                correctPosition: index,
                currentPosition: index
            )
            pieces.append(piece)
        }

        result =  pieces.shuffled()
    }
}

// MARK: PRIVATE FUNCTION
extension PuzzleVM {
    private func splitImageIntoPieces(image: UIImage, rows: Int, columns: Int) -> [UIImage] {
        guard let cgImage = image.cgImage else { return [] }

        let pieceWidth = CGFloat(cgImage.width) / CGFloat(columns)
        let pieceHeight = CGFloat(cgImage.height) / CGFloat(rows)

        var pieces: [UIImage] = []

        for row in 0..<rows {
            for column in 0..<columns {
                let x = CGFloat(column) * pieceWidth
                let y = CGFloat(row) * pieceHeight
                let rect = CGRect(x: x, y: y, width: pieceWidth, height: pieceHeight)

                if let croppedCGImage = cgImage.cropping(to: rect) {
                    let piece = UIImage(cgImage: croppedCGImage)
                    pieces.append(piece)
                }
            }
        }

        return pieces
    }
}
