import Darwin

//* Зная сумму вклада и процентную ставаку по нему за год, рассчитать чему будет равна сумма вклада через 5 лет (с капиталлизацией процентов)//*

// Запросим у пользователя начальную сумму вклада
var sumDeposit: String = readLine() ?? " "

let sumStart: Double = Double(sumDeposit) ?? 0.0

var rate: String = readLine() ?? " "
    
let procent: Double = Double(rate) ?? 0.0

let depositDuration: Double = 5

// Вычислим сумму вклада через 5 лет

var sumFinish = sumStart * pow(1 + (procent/100),depositDuration)

// Вычислим доход по вкладу

var income = sumFinish - sumStart

print("Сумма вашего вклада через \(procent) лет составит \(sumFinish) рублей. Ваш доход по вкладу составит \(income) рублей")
