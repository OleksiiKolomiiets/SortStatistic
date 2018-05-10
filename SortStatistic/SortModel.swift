//
//  SortModel.swift
//  SortStatistic
//
//  Created by Oleksii Kolomiiets on 5/10/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class SortModel: SortModelProtocol {
    var capacityOfArray: Int = 10000
    typealias resultingTime = (random: Int, asc: Int, desc: Int)
    
    private var precision = 1000.0
    
    var methodForSort: SortMethod?
    
    var timeForSorting: [Double] {
        guard let methodForSort = self.methodForSort else { return [Double]() }
        var result = [Double]()
        let timeRandom = timeCountForSortArray(capacity: capacityOfArray, method: methodForSort, arrayType: .random(1, 1.0))
        result.append(round(precision*timeRandom/precision))
        let timeAsc = timeCountForSortArray(capacity: capacityOfArray, method: methodForSort, arrayType: .random(1, 1.0))
        result.append(round(precision*timeAsc/precision))
        let timeDesc = timeCountForSortArray(capacity: capacityOfArray, method: methodForSort, arrayType: .random(1, 1.0))
        result.append(round(precision*timeDesc/precision))
        
        return result
    }
    
    func timeCountForSortArray(capacity: Int, method: SortMethod, arrayType: ArrayType) -> Double {
        var arrayForSort = [Int]()
        switch arrayType {
        case .ascending(_, _) :
            arrayForSort = mergeSort(generateArray(of: capacity))
        case .descending(_, _) :
            arrayForSort = Array(mergeSort(generateArray(of: capacity)).reversed())
        case .random(_, _) :
            arrayForSort = generateArray(of: capacity)
        }
        var counter = 0
        let iterations = 1
        
        switch method {
        case .insertSort:
            let currentDate = Date()
            while counter != iterations {
                sort(by: method, arrayForSort)
                counter += 1
            }
            return -(currentDate.timeIntervalSinceNow/Double(iterations))
        case .quickSort:
            let currentDate = Date()
            while counter != iterations {
                sort(by: method, arrayForSort)
                counter += 1
            }
            return -(currentDate.timeIntervalSinceNow/Double(iterations))
        case .selection:
            let currentDate = Date()
            while counter != iterations {
                sort(by: method, arrayForSort)
                counter += 1
            }
            return -(currentDate.timeIntervalSinceNow/Double(iterations))
        case .buble:
            let currentDate = Date()
            while counter != iterations {
                sort(by: method, arrayForSort)
                counter += 1
            }
            return -(currentDate.timeIntervalSinceNow/Double(iterations))
        case .merge:
            let currentDate = Date()
            while counter != iterations {
                sort(by: method, arrayForSort)
                counter += 1
            }
            return -(currentDate.timeIntervalSinceNow/Double(iterations))
        }
    }
    
    private func sort(by method: SortMethod, _ array: [Int] ) -> [Int] {
        var result = [Int]()
        switch method {
        case .insertSort:
            result = insertSort(array, <)
        case .quickSort:
            result = quickSort(array)
        case .selection:
            result = selection(array)
        case .buble:
            result = buble(array)
        case .merge:
            result = mergeSort(array)
        }
        return result
    }
    
    private func insertSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        guard array.count > 1 else { return array }
        
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderedBefore(temp, a[y - 1]) {
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
    
    private func selection(_ array: [Int]) -> [Int] {
        var copy = array
        var minIndex = 0
        
        for index1 in 0..<copy.count {
            minIndex = index1
            for index2 in index1..<copy.count {
                if copy[minIndex] > copy[index2] {
                    minIndex = index2
                }
            }
            copy.swapAt(index1, minIndex)
        }
        return copy
    }
    
    private func buble(_ array: [Int]) -> [Int] {
        var copy = array
        for index1 in (0..<copy.count).reversed() {
            for index2 in 0..<index1 {
                if copy[index2] > copy[index2 + 1] {
                    copy.swapAt(index2, index2 + 1)
                }
            }
        }
        return copy
    }
    
    private func quickSort<T: Comparable>(_ a: [T]) -> [T] {
        guard a.count > 1 else { return a }
        
        let pivot = a[a.count/2]
        let less = a.filter { $0 < pivot }
        let equal = a.filter { $0 == pivot }
        let greater = a.filter { $0 > pivot }
        
        return quickSort(less) + equal + quickSort(greater)
    }
    
    private func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    private func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile: [T] = []
        if orderedPile.capacity < leftPile.count + rightPile.count {
            orderedPile.reserveCapacity(leftPile.count + rightPile.count)
        }
        
        while true {
            guard leftIndex < leftPile.endIndex else {
                orderedPile.append(contentsOf: rightPile[rightIndex..<rightPile.endIndex])
                break
            }
            guard rightIndex < rightPile.endIndex else {
                orderedPile.append(contentsOf: leftPile[leftIndex..<leftPile.endIndex])
                break
            }
            
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        return orderedPile
    }
    
    func generateArray(of capasity: Int) -> [Int] {
        var generatedArray: [Int] = []
        
        for _ in 0..<capasity {
            generatedArray.append(capasity.arc4random)
        }
        
        return generatedArray
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

