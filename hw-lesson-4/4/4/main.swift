//
//  main.swift
//  4
//
//  Created by Нина Лукашова on 17.07.2021.
//
import Foundation
import SwiftUI


class AnyCar {
       
    let mark: String
    let ageCar: Int
    let color: String
    var km: Double
    var engine: EngineStatus
    
    enum EngineStatus: String{
        case on = "Заведен"
        case off = "Заглушен"
    }

    init(mark: String, ageCar: Int, color: String, km: Double, engine: EngineStatus) {
        self.mark = mark
        self.color = color
        self.ageCar = ageCar
        self.km = km
        self.engine = engine
    }
    
    func action (){}
    
}

class SubClassSportCar: AnyCar{
    
}

var sportCar1 = SubClassSportCar(mark: "Ferrary", ageCar: 2018, color: "red", km: 0.0, engine: AnyCar.EngineStatus.on)





//
//enum actionEngine {
//    case stsrt
//    case turnoff
//
//}
//
//enum Windows: String{
//    case open = "открыты"
//    case close = "закрыты"
//}
//enum Kuzov {
//    case pustKuzov(empty: String)
//    case fullKuzov(full: String)
//    case chast
//}
