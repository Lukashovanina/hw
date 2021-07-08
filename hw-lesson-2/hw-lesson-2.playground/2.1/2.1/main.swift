//
//  main.swift
//  2.1
//
//  Created by Нина Лукашова on 04.07.2021.
//


import Foundation


//Написать функцию, которая определяет четное число или нет

func isEven(numbers: Int) -> Bool {
   
    let result = (numbers % 2 == 0)
    
    return result
}

let myNumbers: Set = [1,20,48,57,64,1178,4987,8890]

for num in myNumbers{
  
    if isEven(numbers: num){
   
        print("\(num) is even number")
  
    } else {
 
        print("\(num) is odd number")
  }
}

