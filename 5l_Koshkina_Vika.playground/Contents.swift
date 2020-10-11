import Cocoa



enum EngineState : String {
   case on = "Включен"
   case off = "Выключен"
}
enum WindowsState : String {
   case open = "Открыто"
   case closed = "Закрыто"
}
enum DoorState : String {
   case open = "Открыто"
   case closed = "Закрыто"
}
enum Roof : String {
   case installed = "Встроенная"
   case removed = "Откидная"
}
enum Trunk : String {
   case up = "Поднят"
   case down = "Опущен"
}



protocol CarProtocol {
    var brand : String {get}
    var year : Int {get}
    var km : Double {get}
    var engineState : EngineState {get set}
    var doorState : DoorState {get set}
    var windowsState : WindowsState {get set}
}
    


    extension CarProtocol {
        mutating func changeEngineState (engineState : EngineState) {
            self.engineState = engineState
        }
        mutating func changeDoorState (doorState : DoorState) {
            self.doorState = doorState
        }
        mutating func changeWindowsState (windowsState : WindowsState) {
            self.windowsState = windowsState
        }
    }




class BasicCar : CarProtocol {
    var brand : String
    var year : Int
    var km : Double
    var engineState : EngineState
    var doorState : DoorState
    var windowsState : WindowsState = .closed
    
    init (brand : String , year : Int , km : Double , engineState : EngineState , doorState : DoorState) {
        self.brand = brand
        self.year = year
        self.km = km
        self.engineState = engineState
        self.doorState = doorState
    }
}

class SportCar : BasicCar , CustomStringConvertible {
    var roofSate : Roof = .installed
    var description: String {
        return """
            "Марка: \(brand)"
            "Год выпуска: \(year)"
            "Пройденный путь: \(km)км"
            "Состояние двигателя: \(engineState.rawValue)"
            "Состояние дверей: \(doorState.rawValue)"
            "Состояние окон: \(windowsState.rawValue)"
            "Наличие крыши: \(roofSate.rawValue)"
            """
    }
}
var car1 = SportCar (brand : "BMW" , year: 2019, km: 250 , engineState: .off , doorState : .closed)


class TruncCar : BasicCar, CustomStringConvertible {
    var trunkState : Trunk = .up
    var description: String {
        return """
            "Марка: \(brand)"
            "Год выпуска: \(year)"
            "Пройденный путь: \(km)км"
            "Состояние двигателя: \(engineState.rawValue)"
            "Состояние дверей: \(doorState.rawValue)"
            "Состояние окон: \(windowsState.rawValue)"
            "Багажник: \(trunkState.rawValue)"
            """
    }
}
var car2 = TruncCar (brand : "Kamaz" , year: 2012, km: 1238, engineState : .on , doorState : .open)

print (car1)
print ("\n")
print (car2)
