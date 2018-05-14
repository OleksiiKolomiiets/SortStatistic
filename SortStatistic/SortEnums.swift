//
//  SortEnums.swift
//  SortStatistic
//
//  Created by Oleksii Kolomiiets on 5/10/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

enum ArrayType {
    case random(Int, Double)
    case ascending(Int, Double)
    case descending(Int, Double)
    
    var description: String {
        switch self {
        case .random(let capacity, let duration):
            return "Random array \(capacity)el. takes: \(duration)sec."
        case .ascending(let capacity, let duration):
            return "Ascending array  \(capacity)el. takes: \(duration)sec."
        case .descending(let capacity, let duration):
            return "Descending array  \(capacity)el. takes: \(duration)sec."
        }
    }
}

enum SortMethod: Int {
    case insertSort = 0, selection, buble, quickSort, merge
    
    var description: String {
        switch self {
        case .insertSort:
            return "Insert Sort"
        case .quickSort:
            return "Quick Sort"
        case .selection:
            return "Selection Sort"
        case .buble:
            return "Buble Sort"
        case .merge:
            return "Merge Sort"
        }
    }
}

