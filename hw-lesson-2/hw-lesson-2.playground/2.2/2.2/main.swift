//
//  main.swift
//  2.2
//
//  Created by Нина Лукашова on 04.07.2021.
//

import Foundation

//Написать функцию, которая определяет делится ли число без остатка на 3

func magicNumbers(numbers: Int) -> Bool {
    
  let result = (numbers % 3 == 0)
    
   return result
}

let myMagicNumbers = [1, 20, 48, 57, 64, 1178, 4987, 8890,]

for myNum in myMagicNumbers{
    
    if magicNumbers(numbers: myNum){
            
            print("\(myNum) делится на 3 без остатка")
    
        } else {
            
            print("\(myNum) делится на 3 с остатком")
        }
    }
        
