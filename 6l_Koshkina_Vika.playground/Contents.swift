import Cocoa

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.



enum CheсkHealthyPeople : String {
    case Health = "Здоров"
    case zombie = "Уже зомби"
}


class AllPeople : CustomStringConvertible {
    var description: String {
        return """
            "Степень заражения: "
            "Имя: "
            """
    }
    
    let checkHealthyPeople : CheсkHealthyPeople
    let name : String
    
    init (checkHealthyPeople : CheсkHealthyPeople , name : String) {
        self.checkHealthyPeople = checkHealthyPeople
        self.name = name
    }
}

struct Queue <T> {
   private var elements: [T] = []
    func filter(predicate:(T) -> Bool) -> [T] {
    var tmpArray: [T] = []
        for element in elements {
            if predicate (element){
            tmpArray.append(element)
        }
    }
    return tmpArray
    }

    mutating func push(_ element: T) {
    elements.append(element)
}

    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}

extension Queue {
    subscript(index: Int) -> T? {
        guard index >= 0 && index < elements.count else {
            return nil
        }
        return elements [index]
    }
}



var allPeople = Queue <AllPeople> ()
allPeople.push(AllPeople(checkHealthyPeople: .Health, name: "Bob"))
allPeople.push(AllPeople(checkHealthyPeople: .zombie, name: "Tom"))
allPeople.push(AllPeople(checkHealthyPeople: .Health, name: "Sara"))
allPeople.push(AllPeople(checkHealthyPeople: .zombie, name: "Konor"))
allPeople.push(AllPeople(checkHealthyPeople: .zombie, name: "Monika"))


print(allPeople)

// Не могу понять, почему при выводе print(allPeople) не выводятся имена
