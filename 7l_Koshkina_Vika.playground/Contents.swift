import Cocoa

// 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

//Задача - собрать армию добровольцев, соответствующую 3-м условиям: возраст, профессия и пол

enum Gender {
    case male
    case female
}

struct Citizen {
    var age: Int
    var gender: Gender
    var profession: Profession
}

struct Profession {
    let name : String
}


// Возможные ошибки

enum ArmyError: Error {
    case noVacancy
    case underMilitaryAge (ageNeeded: Int)
    case anotherGender (genderNeeded: Bool)
    
    var localizedDescription: String {
        switch self{
        case .noVacancy:
            return "Нет вакансий по вашему запросу"
        case .underMilitaryAge(ageNeeded: let ageNeeded):
            return "Вы еще слишком юны, подождите еще \(ageNeeded) год"
        case .anotherGender(genderNeeded: let genderNeeded):
            return "Извините, мы ищем \(genderNeeded)"
        }
    }
}



class Army {
    var mercenaryTroops = [
        "отряд Медсестер": Citizen(age: 16, gender: .female, profession: Profession (name: "отряд Медсестер")),
        "отряд Лучников": Citizen(age: 18, gender: .male, profession: Profession (name: "отряд Лучников")),
        "отряд Копьеносцев": Citizen(age: 18, gender: .male, profession: Profession (name: "отряд Копьеносцев")),
        "отряд Воинов": Citizen(age: 19, gender: .male, profession: Profession (name: "отряд Воинов")),
    ]
    
    
    
// Параметры добровольца - девушка 18-ти лет
    
    var citizenAge = 18
    var citizenGender = Gender.female

    
    func aptitudeWithError(citizenName name: String, citizenAge age: Int, citizenGender gender: Bool) -> (profession: Profession?, error: ArmyError? ) {
        guard let citizen = mercenaryTroops [name] else {
            return (profession: nil, error: .noVacancy)
        }
        
        guard citizen.age <= citizenAge else {
            return (profession: nil, error: .underMilitaryAge(ageNeeded: citizen.age - citizenAge))
        }
        citizenAge = citizen.age
        
        
        guard citizen.gender == citizenGender else {
            return (profession: nil, error: .anotherGender(genderNeeded: true))
        }
        citizenGender = citizen.gender
        
        
        return (profession: citizen.profession, error: nil)
    }
}

// Куда добровольца могут взять

let army = Army()
let citizen1 = army.aptitudeWithError(citizenName: "отряд Магов", citizenAge: 18, citizenGender: false)
let citizen2 = army.aptitudeWithError(citizenName: "отряд Лучников", citizenAge: 20, citizenGender: false)
let citizen3 = army.aptitudeWithError(citizenName: "отряд Воинов", citizenAge: 18, citizenGender: false)
let citizen4 = army.aptitudeWithError(citizenName: "отряд Медсестер", citizenAge: 17, citizenGender: true)

for citizen in [citizen1, citizen2, citizen3, citizen4] {
    if let profession = citizen.profession {
        print("Вы можете вступить в \(profession.name)")
    } else if let error = citizen.error {
        print("Извините. \(error.localizedDescription)")
    }
}




//
print("______________________________")
//

// 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.


class NewArmy {
    var mercenaryTroops = [
        "отряд Медсестер": Citizen(age: 16, gender: .female, profession: Profession (name: "отряд Медсестер")),
        "отряд Лучников": Citizen(age: 18, gender: .male, profession: Profession (name: "отряд Лучников")),
        "отряд Копьеносцев": Citizen(age: 18, gender: .male, profession: Profession (name: "отряд Копьеносцев")),
        "отряд Воинов": Citizen(age: 19, gender: .male, profession: Profession (name: "отряд Воинов")),
    ]
    
    
    
// Параметры добровольца - парень 19-ти лет
    
    var citizenAge = 19
    var citizenGender = Gender.male

    
    func aptitude(citizenName name: String, citizenAge age: Int, citizenGender gender: Bool) throws -> Profession {
        guard let citizen = mercenaryTroops [name] else {
            throw ArmyError.noVacancy
        }
        
        guard citizen.age <= citizenAge else {
            throw ArmyError.underMilitaryAge(ageNeeded: citizen.age - citizenAge)
        }
        citizenAge = citizen.age
        
        
        guard citizen.gender == citizenGender else {
            throw ArmyError.anotherGender(genderNeeded: true)
        }
        citizenGender = citizen.gender
        
        
        return citizen.profession
    }
}

let newArmy = NewArmy()

do{
    
    let someMercenaryTroops = try newArmy.aptitude(citizenName: "отряд Медсестер", citizenAge: 17, citizenGender: false)
    print("Вы вступили в \(someMercenaryTroops.name)")
} catch ArmyError.noVacancy {
    print("Нет вакансий по вашему запросу")
} catch let ArmyError.underMilitaryAge(ageNeeded: ageNeeded) {
    print("Вы еще слишком юны, подождите еще \(ageNeeded) год")
} catch ArmyError.anotherGender {
    print("Извините, мы ищем \(true)")
} catch {
    print ("Что-то пошло не так")
}


