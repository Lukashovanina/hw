import Darwin
// Решить квадратноемуравнение
//ax^2 + bx +c = 0

// Зададим колэффициенты

var a: Double = 4
var b: Double = -15
var c: Double = 8

// Вычислим дискриминант
var x1: Double = 0
var x2: Double = 0
var Discriminant: Double = 0

Discriminant = b * b - 4 * a * c

//Найдем корни уравления

if Discriminant > 0 {
    
    x1 = (-b + sqrt(Discriminant)) / (2 * a)
    x2 = (-b - sqrt(Discriminant)) / (2 * a)
    
    print("Корень 1 = \(x1); Корень 2 = \(x2)")
    
} else if Discriminant == 0 {
    x1 = (-b + sqrt(Discriminant)) / (2 * a)
    
    print("Корень 1 = Корень 2 = \(x1)")
} else {
    print("Корней нет")
}



