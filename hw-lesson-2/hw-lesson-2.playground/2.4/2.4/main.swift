//
//  main.swift
//  2.4
//
//  Created by Нина Лукашова on 04.07.2021.
//

import Foundation

/* Удалить,из созданного ранее массива из задания 2 все четные числа и все числа, которые не делятся на 3 */

var myOneHundredArray = [Int]()

for a in 1...100{
  
    myOneHundredArray.append(a)
}
   
var deleteNumbers = myOneHundredArray.filter {$0 % 2 != 0 && $0 % 3 == 0}

print(deleteNumbers)
