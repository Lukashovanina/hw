import Foundation
import SwiftUI


class AnyCar {
       
    let mark: String
    var ageCar: Int
    var engine: EngineStatus
    var doors: DoorsState
    static var carCount = 0
            
    enum DoorsState: String {
        case unbloced = "двери открыты"
        case bloced = "двери закрыты"
    }
    
    enum EngineStatus: String{
        case on = "заведен"
        case off = "заглушен"
    }
    
    init(mark: String, ageCar: Int, engine: EngineStatus, doors: DoorsState) {
        self.mark = mark
        self.ageCar = ageCar
        self.engine = engine
        self.doors = doors
        AnyCar.carCount += 1
    }
    
    func printType() {
        print("Эта машина типа AnyCar")
    }
    
    static func countInfo() {
        print("В салон поступило \(AnyCar.carCount) новых автомобиля")
    }
    
    func onEngineStatus() {
        engine = .on
        print("Двигатель сейчас заведен")
    }
    
    func offEngineStatus(){
        engine = .off
        print("Двигатель сейчас заглушен")
    }
    
    func printAnyCar() {
        
    }
}



class SportCar: AnyCar {
    
    var color: String
    var transmission: Transmission
    var windows: WindowState
    var sunroofState: CarSunroofState
    static var sportCarCount: Int = 0

    enum WindowState: String {
        case open = "окна открыты"
        case close = "окна закрыты"
    }
                    
    enum CarSunroofState: String{
        case up = "люк открыт"
        case down = "люк закрыт"
    }
    
    enum Transmission{
        case manual, auto
    }

    enum actionWindowState {
        case windowUp
        case windowDown
    }
    
    init(mark: String,
         ageCar: Int,
         color: String,
         engine: EngineStatus,
         doors: DoorsState,
         windows: WindowState,
         sunroofState: CarSunroofState,
         transmission: Transmission) {
        self.color = color
        self.windows = windows
        self.sunroofState = sunroofState
        self.transmission = transmission
        SportCar.sportCarCount += 1
        super.init(mark: mark, ageCar: ageCar, engine: engine, doors: doors)
    }
    
    override func printType() {
        print("Эта машина типа SportCar")
    }
    
    static func printSportInfo() {
        print("В салон поступило \(SportCar.sportCarCount) спортивных автомобиля")
    }
        
    func executeAction(action: WindowState) {
        switch action {
        case .open:
            print(action.rawValue)
            self.windows = .open
        case .close:
            print(action.rawValue)
            self.windows = .close
        }
    }
    
    func description() {
        print("Автомобиль марки \(mark),цвет \(color),\n\(ageCar) года выпуска, коробка передач \(transmission).\nДвигатель сейчас \(engine.rawValue),все \(doors.rawValue),\(sunroofState.rawValue).")
    }

}



var car1 = SportCar(mark: "Ferrary", ageCar: 2018, color: "красный", engine: .off, doors: .unbloced, windows: .open, sunroofState: .up, transmission: .manual)
var car2 = SportCar(mark: "Porshce", ageCar: 2020, color: "желтый", engine: .off, doors: .bloced, windows: .open, sunroofState: .down, transmission: .auto)


    
car1.mark
car2.ageCar
car1.sunroofState
car2.color
car1.doors = .unbloced
car2.windows = .close
print(car2.windows.rawValue)
car2.engine = .on
print(car2.onEngineStatus())

car2.ageCar = 2018

if car1.ageCar > car2.ageCar{
    print(car1.mark, "год выпуска старше",car2.mark)
} else if car1.ageCar < car2.ageCar{
    print(car2.mark, "год выпуска старше",car1.mark)
} else{
   print(car1.mark, "одного года выпуска",car2.mark)
}

print(car1.description())
print(car2.description())
print(car1.doors)
print(AnyCar.carCount)
print(AnyCar.countInfo())
print(car1.doors)



class TrunkCar: AnyCar {

    var km: Double {
        didSet {
            let trip = km - oldValue
            print("Пробег увеличился на \(trip) км")
        }
    }
    
    var obemKuzov: Kuzov
    var obemFullKuzov: Double
    
    enum Kuzov {
        case pustKuzov(empty: String)
        case fullKuzov(full: String)
        case chastKuzov(kg: Double)
    }

    init(mark: String,
         ageCar: Int,
         engine: EngineStatus,
         doors: DoorsState,
         km: Double,
         obemKuzov: Kuzov,
         obemFullKuzov: Double
    ) {
        self.km = km
        self.obemKuzov = obemKuzov
        self.obemFullKuzov = obemFullKuzov
        super.init(mark: mark, ageCar: ageCar, engine: engine, doors: doors)
    }
    
    override func printType() {
        print("Эта машина типа TrunkCar")
    }
    
    func description() {
        print("Автомобиль марки \(mark),\(ageCar) года выпуска,объем кузова \(obemFullKuzov)\nДвигатель сейчас \(engine.rawValue),все \(doors.rawValue), пробег \(km), кузов заполнен \(obemKuzov)")
    }
}

var car3: TrunkCar = TrunkCar(mark: "MAN", ageCar: 2010, engine: .off, doors: .bloced, km: 0.0, obemKuzov: .pustKuzov(empty: "кузов пустой"), obemFullKuzov: 500)
var car4: TrunkCar = TrunkCar(mark: "MERSEDES", ageCar: 2015, engine: .off, doors: .bloced, km: 0.0, obemKuzov: .pustKuzov(empty: "кузов пустой"), obemFullKuzov: 300)

car1.printType()
car2.printType()
car3.printType()
car4.printType()

car3.km = 1200
print(car3.km)

print(car3.description())
print(car4.description())
print(TrunkCar.carCount)
print(TrunkCar.countInfo())


SportCar.printSportInfo()
