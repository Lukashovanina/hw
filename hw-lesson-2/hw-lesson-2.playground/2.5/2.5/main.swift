//
//  main.swift
//  2.5
//
//  Created by Нина Лукашова on 04.07.2021.
//

import Foundation

func fiboArray(_ n: Int) -> [Int]{
    
    var fiboNum: [Int] = [1,1]
    
    (2...n).forEach{ i in
        
        fiboNum.append(fiboNum[i - 1] + fiboNum[i - 2])
    }
return fiboNum
    
}

print(fiboArray(50))
