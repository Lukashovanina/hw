import UIKit


import Foundation



/* Диснейленд.Сертификат для посещения аттракционов. возможные ошибки: мало баллов, закончилось время посещения, карта неисправна*/

enum CreditCertificateError: Error {
    case notEnoughPoints(pointRequired:Double)
    case certificateExspired
    case faultyCertificate
}

// аттракционы и их стоимость

struct attraction {
    var price: Double
}

// начальные данные: номинал сертификата в баллах, начальный балланс, блокировка

class CreditCertificate {
    let denomination: Double = 0
    var balance: Double = 0
    var cardIsBlocked = false
    var cardIsBreak = false

/* проверяем можем ли посетить аттракцион, наличие баллов, рассчитываем остаток баллов с учетом лимита и списываем баллы после посещения */

    func buySession (attrachion: attraction ) throws {
        guard cardIsBlocked == false else {
            throw CreditCertificateError.certificateExspired
        }
        guard cardIsBreak == false else {
            throw CreditCertificateError.faultyCertificate
        }
        guard attrachion.price <= (denomination + self.balance)else {
            if balance < 0 {
            throw CreditCertificateError.notEnoughPoints(pointRequired: attrachion.price + denomination + balance)
            } else {
            throw CreditCertificateError.notEnoughPoints(pointRequired: attrachion.price + denomination - balance)
            }
        }
        balance = self.balance - attrachion.price
    }

// функция для пополнения сертификата баллами 💷

    func depositPoints (somePoints: Double) {
        balance = self.balance + somePoints
    }

// функция "живой баланс"🤡

    func printBalance() {
        print ("На вашем сертификате \(balance) баллов")
    }

// возможная блокировка сертификата если сеанс закончился 🥶

    func changeCertificateState(cardIsBloced: Bool){
        switch cardIsBloced {
        case true:
            self.cardIsBlocked = true
        case false:
            self.cardIsBlocked = false
        }
    }

// сертификат не исправен

    func changeCertificateStatus(cardIsBreak: Bool){
        switch cardIsBreak {
            case true:
                self.cardIsBreak = true
            case false:
                self.cardIsBreak = false
        }
    }
}

// вывод ошибок

extension CreditCertificateError: CustomStringConvertible {
    var description: String {
        switch self {
        case .notEnoughPoints( let pointRequired): return "На сертификате недостаточно баллов для посещения этого аттракциона.  Ваш балланс: \(operation.balance) баллов, для посещения аттракциона пополните сертификат на \(pointRequired) баллов)"
        case .certificateExspired: return "Ваш сертификат заблокирована.Подойдите к администратору."
            case .faultyCertificate: return "Сертификат неисправен, требуется замена"
        }
    }
}

// вперед в диснейленд))🎯

let operation = CreditCertificate()
do {
    try operation.buySession(attrachion:  .init(price: 1500.0))
} catch let error as CreditCertificateError {
    print(error.description)
}

operation.printBalance()
operation.depositPoints(somePoints: 5000.0)
operation.printBalance()

do {
    try operation.buySession(attrachion: .init(price: 2500.0))
} catch let error as CreditCertificateError {
    print(error.description)
}

operation.printBalance()

do{
    try operation.buySession(attrachion: .init(price: 3754.00))
} catch let error as CreditCertificateError {
    print(error.description)
}

operation.printBalance()

/* закончилось время сеанса. сертификат заблокировали. пытаемся пройти на следующий аттракцион */

operation.changeCertificateState(cardIsBloced: false)

do{
    try operation.buySession(attrachion: .init(price: 2500.00))
} catch let error as CreditCertificateError{
    print(error.description)
}

/* сертификат не исправен, мы не в курсе и идем на следующий аттракцион */

operation.changeCertificateStatus(cardIsBreak: true)

do{
    try operation.buySession(attrachion: .init(price: 1700.00))
} catch let error as  CreditCertificateError{
    print(error.description)
}

    
