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


class Car {
    var mark : String
    var year : Int
    var km : Double
    var vehiclWheel : Double
    var engineState : EngineState
    var doorState : DoorState
    var windowsState : WindowsState
    
    init (mark : String , year : Int , km : Double, vehiclWheel : Double , engineState : EngineState , doorState : DoorState , windowsState : WindowsState) {
        self.mark = mark
        self.year = year
        self.km = km
        self.vehiclWheel = vehiclWheel
        self.engineState = engineState
        self.doorState = doorState
        self.windowsState = windowsState
}

    func changeEngineState (to: EngineState) {}
    func changeDoorState (to: DoorState) {}
    func changeWindowsState (to: WindowsState) {}
    
    func printDetail() {
        print ("Состояние окон: \(self.windowsState.rawValue)")
        print ("Состояние дверей: \(self.doorState.rawValue)")
        print ("Состояние двигателя: \(self.engineState.rawValue)")
        print ("Пройдено км: \(self.km)")
    }

}
   

class SportCar : Car {
        var roof : Roof
        init (mark : String , year : Int , km : Double, vehiclWheel : Double , engineState : EngineState , doorState : DoorState , windowsState : WindowsState , roof : Roof) {
        self.roof = roof
        super.init (mark : mark , year : year , km : km, vehiclWheel : vehiclWheel , engineState : engineState , doorState : doorState, windowsState : windowsState)
    }
    func changeRoofState (to: Roof) {
        roof = to
    }
        
        func alarmOff () {
            engineState = .on
            doorState = .open
            windowsState = .open
        }
        func alarmOn () {
            engineState = .off
            doorState = .closed
            windowsState = .closed
        }
    
        override func changeEngineState(to: EngineState) {
            engineState = to
        }
        override func changeDoorState (to: DoorState){
            doorState = to
        }
        override func changeWindowsState (to: WindowsState) {
            windowsState = to
        }
   override func printDetail() {
    super.printDetail()
        print ("Крыша: \(self.roof.rawValue)")

     }
    }

class TrunkCar : Car {
    var trunk : Trunk
    init (mark : String , year : Int , km : Double, vehiclWheel : Double , engineState : EngineState , doorState : DoorState , windowsState : WindowsState , trunk : Trunk) {
        self.trunk = trunk
        super.init (mark : mark , year : year , km : km, vehiclWheel : vehiclWheel , engineState : engineState , doorState : doorState, windowsState : windowsState)
    }
    func changeTrunkState (to: Trunk) {
        trunk = to
    }
    override func changeEngineState(to: EngineState) {
        engineState = to
    }
    override func changeDoorState (to: DoorState){
        doorState = to
    }
    override func changeWindowsState (to: WindowsState) {
        windowsState = to
    }
    override func printDetail() {
        super.printDetail()
        print ("Багажник: \(self.trunk.rawValue)")
    }
}


var car1 = SportCar (mark : "Audi" , year : 2019 , km : 0, vehiclWheel : 1300 , engineState : .off , doorState : .closed , windowsState : .closed , roof : .removed)

var car2 = SportCar (mark : "Ferrari" , year : 2012 , km : 550, vehiclWheel : 1150 , engineState : .off , doorState : .open , windowsState : .open , roof : .installed)

var car3 = TrunkCar (mark : "Vaz" , year : 2002 , km : 1750, vehiclWheel : 5150 , engineState : .off , doorState : .open , windowsState : .open , trunk : .down)

var car4 = TrunkCar (mark : "MAN" , year : 2015 , km : 350, vehiclWheel : 6150 , engineState : .off , doorState : .open , windowsState : .open , trunk: .up)


car1.changeEngineState (to: .on)
car1.alarmOn()

car2.changeRoofState(to: .removed)

car3.changeDoorState(to: .closed)
car3.changeTrunkState(to: .up)

car4.changeTrunkState(to: .down)
car4.km = 240

print ("____")
car1.printDetail()
print ("____")
car2.printDetail()
print ("____")
car3.printDetail()
print ("____")
car4.printDetail()
