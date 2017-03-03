//
//  Puzzle.swift
//  Puzzle
//
//  Created by Nicholas Mercier on 2017-03-02.
//  Copyright © 2017 Nicholas Mercier. All rights reserved.
//

import Foundation
import UIKit

class Puzzle {
    
    var dim = 3
    var puzzle = [Int]()
    
    init(){
        
        for i in 0 ... dim * dim - 1 {
            puzzle.append(i)
        }
        
    }
    
    var emptyPos = 8
    func shuffle(){
        for i in 0 ... 100 {
            randomSlide()
        }
    }
    
    func randomSlide(){
        let available = generateAvailable()
        let r = Int(arc4random_uniform(UInt32(available.count)))
        let ind = available[r]
        swap(v1:ind, v2:emptyPos)
        emptyPos = ind
    }
    
    func swap(v1:Int, v2:Int){
        let tmp = puzzle[v2]
        puzzle[v2] = puzzle[v1]
        puzzle[v1] = tmp
    }
    
    func printState(){
        
        var str = ""
        for i in 0 ... dim * dim - 1 {
            str = str + "\(puzzle[i]) "
        }
        print(str)
        
    }
    
    func performMove(ind:Int){
        if validMove(ind: ind){
            swap(v1: ind, v2: emptyPos)
            emptyPos = ind
        }
    }
    
    func validMove(ind:Int) -> Bool {
        return generateAvailable().contains(ind)
    }
    
    func generateAvailable() -> [Int] {
        var available = [Int]()
        if emptyPos % dim != 0 {
            available.append(emptyPos - 1)
        }
        if (emptyPos + 1 ) % dim != 0 {
            available.append(emptyPos + 1)
        }
        if emptyPos - dim >= 0 {
            available.append(emptyPos - dim)
        }
        if emptyPos + dim < dim * dim {
            available.append(emptyPos + dim)
        }
        return available
    }
    
    func getPiecePosition(value:Int) -> Int {
        for i in 0 ... dim * dim - 1 {
            if puzzle[i] == value {
                return i
            }
        }
        return -1
    }
    
}
