//
//  PriorityQueue.swift
//  Algorithm
//
//  Created by 임영선 on 2022/10/05.
//

import Foundation

struct Heap<T: Comparable> {
    private var elements: [T]
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.isEmpty
    }
    var peek: T? {
        return self.elements.first
    }
    var count: Int {
        return self.elements.count
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.sortFunction = sortFunction
        if !elements.isEmpty {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    func parent(of index: Int) -> Int {
        return index / 2
    }
    mutating func add(element: T) {
        self.elements.append(element)
    }
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    mutating func swimUp(from index: Int) {
        var index = index
        while index >= 0 && self.sortFunction(self.elements[index], self.elements[index/2]) {
            self.elements.swapAt(index/2, index)
            index /= 2
        }
    }
    mutating func buildHeap() {
        for index in (0...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    mutating func insert(node: T) {
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    mutating func remove() -> T? {
        if self.elements.isEmpty { return nil }
        self.elements.swapAt(0, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 0)
        
        return deleted
    }
}

struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
        heap = Heap(elements: elements, sortFunction: sort)
    }
    
    var count : Int {
        return heap.count
    }
    var isEmpty : Bool {
        return heap.isEmpty
    }
    
    func top () -> T? {
        return heap.peek
    }
    mutating func clear () {
        while !heap.isEmpty {
            _ = heap.remove()
        }
    }
    mutating func pop() -> T? {
        return heap.remove()
    }
    mutating func push(_ element: T) {
        heap.insert(node: element)
    }
}

var pq: PriorityQueue<Int> = PriorityQueue<Int>([], <)
pq.push(1)
pq.push(3)
pq.push(2)
pq.push(5)

print(pq.pop()!)
print(pq.top()!)


while !pq.isEmpty {
    print(pq.pop())
}

// 출처 : https://github.com/jeonyeohun/Data-Structures-In-Swift/tree/main/PriorityQueue/PriorityQueue

