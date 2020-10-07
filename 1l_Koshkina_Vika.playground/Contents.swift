import Foundation

//Задание 1 : Решить квадратное уравнение

let a = 2.0, b = 14.0, c = 12.0
let x1, x2 : Double
let discriminant = b * b - 4 * a * c

if discriminant > 0 {
    x1 = (-b + sqrt(discriminant)) / (2 * a)
    x2 = (-b - sqrt(discriminant)) / (2 * a)
    print("корень x1 \(x1)")
    print("корень x2 \(x2)")
}
else if discriminant == 0 {
    x1 = (-b + sqrt(discriminant)) / (2 * a)
    print("корень уравнения \(x1)")
}
else {
    print("корней нет")
}


//_______________________________________
print("\n")
//Задание 2 : Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let sideA : Double = 10
let sideB : Double = 25

let squareTriangle = 0.5 * sideA * sideB
let gipotenusa = sqrt((sideA * 2) + (sideB * 2))
let perimetr = sideA + sideB + gipotenusa

print("площадь = \(squareTriangle)")
print("гипотенуза = \(gipotenusa)")
print("периметр = \(perimetr)")



//_______________________________________
print("\n")
//Задание 3 : Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var deposite : Double = 100
var percent : Double = 7.5
var years = 5
let rate = percent / 100

deposite = deposite * pow(1 + rate, Double(years))

print("депозит = \(round ( deposite * 100) / 100) рублей")
