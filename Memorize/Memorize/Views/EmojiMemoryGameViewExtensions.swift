//
//  ContentViewExtensions.swift
//  Memorize
//
//  Created by Trenton Parrotte on 7/31/24.
//

import Foundation
import SwiftUI

extension EmojiMemoryGameView {
    // Helper Functions
    
    func createSuffledPairedArray(with theme: [String], numberOfPairs: Int) -> [String] {
        var result: [String] = []
        for emoji in theme {
            for _ in 0..<numberOfPairs {
                result.append(emoji)
            }
        }
        return result.shuffled()
    }
    
    func gridItemWidthThatFits(count: Int, size: CGSize, atAspectRatio aspectRatio: CGFloat) -> CGFloat {
        var colCount = 1.0
        let count = CGFloat(count)
        repeat {
            let width = size.width / colCount
            let height = width / aspectRatio
            
            let rowCount = (count / colCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / colCount).rounded(.down)
            }
            colCount += 1
        } while colCount < count
        
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}
