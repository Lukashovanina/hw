import UIKit
import Foundation
import SwiftUI



enum ActionDoors {
    case unbloced
    case bloced
}
enum ActionEngine {
    case on, off
}
enum ActionWindow {
    case open, close
}


protocol CarProtocol {
    
    var mark: String { get }
    var ageCar: Int { get }
    var km: Double { get set }
    var color: String { get }
    var alarm:(String, String) { get }
    
    func alarmSystem()
}

extension CarProtocol {
    
    func actionDoors(action: ActionDoors) {
        switch action {
        case .unbloced:
            print("двери разблокированы")
        default:
            print("двери заблокированны")
        }
    }
    func actionWindow(action: ActionWindow) {
        switch action {
        case .open:
            print("окна открыты")
        default:
            print("окна закрыты")
        }
    }
    func actionEngine(action: ActionEngine) {
        switch action {
        case .on:
            print("Двигатель сейчас заведен")
        case .off:
            print("Двигатель сейчас заглушен")
        }
    }
}

class SportCar: CarProtocol {
    var alarm: (String, String)
    var mark: String
    var ageCar: Int
    var km: Double
    var color: String
    
// добавим личные свойства класса SportCar
    
    var transmission: Transmission
    var sunroof: Sunroof
    
    enum Transmission {
        case manual, auto
    }
    enum Sunroof: String {
        case yes = "имеется люк"
        case no = "люк отсутствует"
    }
    
    init(mark: String, ageCar: Int,
         color: String, alarm: (String,String),
         km: Double, sunroof: Sunroof,
         transmission: Transmission) {
        self.alarm = alarm
        self.mark = mark
        self.color = color
        self.ageCar = ageCar
        self.km = km
        self.sunroof = sunroof
        self.transmission = transmission
    }
    func actionDoors(){
    }
    func actionWindow(){
    }
    func actionEngine(){
    }
    
    func alarmSystem() {
        print("Орет сигнализация.Несанкционированное проникновение в машину")
    }
    
}
extension SportCar{
    func printType() {
        print("Эта машина типа SportCar")
            
        }
    }
//имплементируем классу SportCar протокол "CustomStringConvertible"


extension SportCar: CustomStringConvertible {
    var description: String {
        return("Автомобиль марки \(mark),цвет \(color),\(ageCar) года выпуска,\nкоробка передач \(transmission).В комплектации машины \(sunroof.rawValue),\nсигнализация \(alarm)")
        }
    }

    var car1 = SportCar(mark: "Ferrari", ageCar: 2018, color: "красный", alarm: ("установлена","включена"), km: 0.0, sunroof: .yes, transmission: .auto)

    var car2 = SportCar(mark: "Porche", ageCar: 2020, color: "желтый", alarm:("не установлена"," "), km: 0.0, sunroof: .no, transmission: .manual)

print(car1.transmission)
print(car2.description)
print(car1.description)
print(car1.alarmSystem())
car1.actionEngine(action: .on)
car2.actionDoors(action: .bloced)
car2.actionEngine(action: .off)
car2.actionDoors(action: .unbloced)
car1.actionWindow(action: .close)
car2.actionWindow(action: .open)


class TrunkCar:  CarProtocol {
    var alarm: (String, String)
    var mark: String
    var ageCar: Int
    var color: String
    var km: Double {
        didSet {
            let trip = km - oldValue
                print("Пробег увеличился на \(trip) км")
        }
    }
// добавим личные сврйства для класса TrunkCar
    
    var obemKuzov: Kuzov
    var obemFullKuzov: Double
    
    enum Kuzov {
        case pustKuzov(empty:String)
        case fullKuzov(full: String)
        case chastKuzov(kg: Double)
        
    }
    init(mark: String, ageCar: Int,alarm: (String,String), color: String, km: Double, obemKuzov: Kuzov, obemFullKuzov: Double) {
        self.mark = mark
        self.alarm = alarm
        self.color = color
        self.ageCar = ageCar
        self.km = km
        self.obemKuzov = obemKuzov
        self.obemFullKuzov = obemFullKuzov
        
    }
    func actionDoors(){
    }
    func actionWindow(){
    }
    func actionEngine(){
    }
    func alarmSystem(){
        print("Орет сигнализация.Несанкционированное проникновение в машину")
        }
    }
extension TrunkCar{
    func printType() {
        print("Эта машина типа TrunkCar")
                
        }
    }

// имплементируем классу SportCar протокол "CustomStringConvertible"

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return("Автомобиль марки \(mark),цвет \(color),\(ageCar) года выпуска,\nобъем кузова \(obemFullKuzov),\nсигнализация\(alarm),сейчас кузов \(obemKuzov)")
        }
    }


    var car3: TrunkCar = TrunkCar(mark: "MAN", ageCar: 2010, alarm: ("не установлена"," "), color: "black", km: 0.0, obemKuzov: .fullKuzov(full: "проностью загружен"), obemFullKuzov: 500)

    var car4: TrunkCar = TrunkCar(mark: "MERSEDES", ageCar: 2015, alarm: ("установлена","выключена"), color: "white", km: 0.0, obemKuzov: .pustKuzov(empty: "пустой"), obemFullKuzov: 300)

car1.printType()
car2.printType()
car3.printType()
car4.printType()
car3.km = 1200
print(car3.km)
car4.km = 2500
print(car4 .km)
print(car3.description)
print(car4.description)
car3.actionEngine(action: .on)
car3.actionDoors(action: .bloced)
car4.actionEngine(action: .off)
car4.actionDoors(action: .unbloced)
car3.actionWindow(action: .close)
car4.actionWindow(action: .open)
print(car1)
print(car2)
print(car3)
print(car4)
