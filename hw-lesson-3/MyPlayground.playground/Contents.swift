import Foundation


enum CarSunroofState{

    case open,close

}

enum CarTrunkStatus:String {

    case uploader,full

}


struct SportCar {

    var mark: String

    var model: String

    var ageCar: Int

    var color: String

    var engine: Double

    var trunkStatus: CarTrunkStatus

mutating func fullTrunkStatus() {

        self.trunkStatus = .full

    }

mutating func uploaderTrunkStaus() {

        self.trunkStatus = .uploader

    }

    
    var sunroofState: CarSunroofState {

     willSet {

        if newValue == .close{

        print("Люк \(SportCar.self) сейчас закроется")

        } else{

        print ("Люк\(SportCar.self) сейчас откроется")

        }

      }

   }

}



var car = SportCar (mark: "Ferrari", model: "Roma", ageCar: 2019, color: "Красный", engine: 3.9, trunkStatus: .full, sunroofState: .open)


car.sunroofState = .close

print(car.sunroofState)
var car1 = car

car1.model = "812 Gts"

car1.engine = 6.5

car1.color = "Желтый"



car.trunkStatus = .uploader

print(car1.ageCar, "\n",car1.engine)



let m1: String = "Машина 1"

let m2: String = "Maшина 2"

if car1.ageCar > car.ageCar {

    print( m2, "старее", m1)

   } else if car1.ageCar == car.ageCar {

      print ("Машины одного года выпуска")

       } else {

    print( m1, "старее", m2)

}



enum CarBodyWorkStatus {

    case withCargo, withoutCargo

}


struct TrunkCar {

    var mark: String

    var ageCar: Int

    var bodyWork: Int

    let typeBodyWork: String

    var bodyWorkStatus: CarBodyWorkStatus

func description() {

        print("Автомобиль марки  \(mark) имеет тип кузова \(typeBodyWork)")

    }

mutating func withCargoBodyWork() {

        self.bodyWorkStatus = .withCargo

   }

mutating func withoutCargoBodyWork() {

        self.bodyWorkStatus = .withoutCargo

   }

    var km: Double {

didSet {

        let trip = km - oldValue

        print("Пробег увеличился на \(trip) км")
        
    }

   }

}



var trunkCar = TrunkCar (mark: "Scania 164L Topclass", ageCar: 2000, bodyWork: 500, typeBodyWork: "Рефрижератор", bodyWorkStatus: .withoutCargo, km: 12580.0)


trunkCar.km = 13100.0

trunkCar.description()

print(trunkCar.km)



print(car,"\n",car1,"\n", trunkCar)


print(car,"\n",car1,"\n", trunkCar)
