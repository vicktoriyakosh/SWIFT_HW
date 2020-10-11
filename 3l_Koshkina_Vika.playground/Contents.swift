import Cocoa

// грузовик

enum Transmission {
    case auto , manual
}
enum EngineState {
    case on , off
}
enum DoorState {
    case open , closed
}
enum TankLevel {
    case full , empty
}
enum Trailer {
    case big, small
}


struct TrunkCar {
    var brand : String
    var trailer : Trailer
    var trunkCapacity : Int
    var trunkFilledCapacity : Int
    var engineCapacity : Int
    var spareWheel : Bool
    var engineState : EngineState
    var doorState : DoorState
    var tankLevel : TankLevel
    
    mutating func openDoor () {
        doorState = .open
    }
    mutating func closeDoor () {
        doorState = .closed
    }
    mutating func tankLevel (_ tankLevel : TankLevel) {
        self.tankLevel = tankLevel
    }
    mutating func engineState (_ engineState : EngineState) {
        self.engineState = engineState
    }
}


//спорт-кар

struct SportCar {
    var brand : String
    var yearOfissue : Int
    var maxSpeed : Int
    var transmission : Transmission
    var engineState : EngineState
    var doorState : DoorState
    var parkingSensor : Bool
    var tankLevel : TankLevel
    
    mutating func doorState (_ doorState : DoorState) {
        self.doorState = doorState
    }
    mutating func fillTank () {
        tankLevel = .full
    }
    mutating func emptyTank() {
        tankLevel = .empty
    }
    mutating func engineOn() {
        engineState = .on
    }
    mutating func engineOff() {
        engineState = .off
    }
}

func printTrunkCarProp (car : TrunkCar) {
    print ("_____")
    print("Марка: \(car.brand)")
    print("Размер прицепа: \(car.trailer == .big ? "большой" : "маленький") ")
    print("Объем багажника: \(car.trunkCapacity) литров")
    print("Заполненный объем багажника: \(car.trunkFilledCapacity) литров")
    print("Объем двигателя: \(car.engineCapacity) см3")
    print("Наличие запасного колеса: \(car.spareWheel ? "есть" : "отсутствует")")
    print("Состояние двигателя: \(car.engineState == .on ? "вкл." : "выкл.")")
    print("Состояние дверей: \(car.doorState == .open ? "открыты" : "закрыты")")
    print("Уровень бензина в бензобаке: \(car.tankLevel == .full ? "заполнен" : "пустой")")
}


func printSportСarProp (car : SportCar) {
    print ("_____")
    print("Марка: \(car.brand)")
    print("Год выпуска: \(car.yearOfissue) год")
    print("Максимальная скорость: \(car.maxSpeed) км/ч")
    print("Коробка передач: \(car.transmission == .auto ? "автомат" : "механика")")
    print("Состояние двигателя: \(car.engineState == .on ? "вкл." : "выкл.")")
    print("Состояние дверей: \(car.doorState == .open ? "открыты" : "закрыты")")
    print("Парктроник: \(car.parkingSensor ? "есть" : "отсутствует")")
    print("Уровень бензина в бензобаке: \(car.tankLevel == .full ? "заполнен" : "пустой")")
}


// создаем 2 спорт-машины, изменив часть свойств
var sportCar1 = SportCar (brand: "BMW" , yearOfissue : 2015 , maxSpeed : 320 , transmission: .auto , engineState: .off , doorState : .closed , parkingSensor : true , tankLevel: . empty)
sportCar1.yearOfissue = 2013
sportCar1.maxSpeed = 350

var sportCar2 = SportCar (brand: "Audi" , yearOfissue : 2018 , maxSpeed : 385 , transmission: .manual , engineState: .on , doorState : .open , parkingSensor : false , tankLevel: . full)
sportCar2.fillTank()
sportCar2.engineOn()
sportCar2.doorState(.closed)

printSportСarProp (car: sportCar1)
printSportСarProp (car: sportCar2)


// создаем 2 грузовика, изменив часть свойств
var trunkCar1 = TrunkCar(brand: "Gaz" , trailer : .big, trunkCapacity : 1000, trunkFilledCapacity : 500, engineCapacity : 3, spareWheel : true, engineState : .off, doorState : .open , tankLevel : .full)
trunkCar1.engineState(.on)
trunkCar1.tankLevel(.empty)


var trunkCar2 = TrunkCar(brand: "Volvo" , trailer : .small, trunkCapacity : 500, trunkFilledCapacity : 380, engineCapacity : 2, spareWheel : true, engineState : .on, doorState : .closed , tankLevel : .empty)
trunkCar2.openDoor ()

printTrunkCarProp (car: trunkCar1)
printTrunkCarProp (car: trunkCar2)
