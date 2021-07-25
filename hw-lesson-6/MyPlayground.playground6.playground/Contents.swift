import Cocoa

import Foundation



struct Queue <T> {

    private var item = [T]()
    
    mutating func enqueue (_ element: T) {

        item.append(element)

    }

    mutating func dequeue() -> T? {

        if item.isEmpty{

            return nil

        } else {

    let tempElement = item.first

        item.remove(at: 0)

            return tempElement

        }
    }

    func filter ( _ predicate: (T) -> Bool )->[T] {

        var result = [T]()

            for element in item  {

                if predicate(element) {

                result.append(element)

            }
    }
        return result
}

    

subscript (indexes: Int) -> T? {

    guard indexes < item.count, indexes >= 0 else {return nil}

    return item[indexes]

    }
}

extension Queue: CustomStringConvertible{

    var description: String{

        return "\(Array(item.reversed()))"

    }

}

var queue = Queue<Int>()

queue.enqueue(10)

queue.enqueue(20)

queue.enqueue(50)

queue.dequeue()

queue.enqueue(17)

queue.enqueue(165)

queue.dequeue()

print(queue)

print(queue[2])

var queue2 = Queue<Int>()

queue2.enqueue(54)

queue2.enqueue(75)

queue2.dequeue()

queue2.enqueue(85)

queue2.enqueue(72)

queue2.enqueue(13)

queue2.dequeue()

queue2.enqueue(16)

queue2.description

print(queue2)

print(queue2[16])

