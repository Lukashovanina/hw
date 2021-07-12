import Foundation

//* Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.let n = 1000 *//

let n = 1000

var used: Array<Int> = []

for _ in 0...n {
    used.append(0)
}

for p in 2...n {
    if used[p] == 0 {
        var x = p * p
        while x < n {
            used[x] = 1
            x += p
        }
    }
}

var ans: Array<Int> = []

for x in 2...n {
    if used[x] == 0 && ans.count < 100 {
        ans.append(x)
    }
}

print(ans)
