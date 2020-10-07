import Foundation

//_____________________________________________________
//1. Написать функцию, которая определяет, четное число или нет.

func evenNumbers (num : Int) -> Bool {
        return num % 2 == 0
}



//_____________________________________________________
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func divisionnum (num : Int) -> Bool {
    return num % 3 == 0
}




//_____________________________________________________
// 3. Создать возрастающий массив из 100 чисел.

var array : [Int] = []
for element in 1...100 {
    array.append(element)
}
print(array)


print("\n")
//_____________________________________________________
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var delete = array.filter {$0 % 2 != 0 && $0 % 3 != 0}
print(delete)

