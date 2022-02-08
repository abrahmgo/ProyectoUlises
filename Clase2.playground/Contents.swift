import Foundation

// tipos de datos
let entero: Int = 234
let cadena: String = "este es un ejemplo"
let caracter: Character = "e"
let doble: Double = 2.432
let flotante: Float = 213.213

// referencias

// referencia fuerte
class ViewController {
    
    let myAge: Int
    
    init(myAge: Int) {
        self.myAge = myAge
    }
    
    /*
     
     -- vive mientras tu lo decidas
     
     */
}

// referencia debil
struct ViewController2 {
    
    var myAge: Int
    /*
     
     -- vive mientras las uses
     
     */
}

// referencia debil
// no pueden contener propiedades
enum ViewController3 {

    case young
    case younger
    case old
    case oldest
    
    func myFunc() {
        
        switch self {
        case .young:
            print("")
        case .younger:
            print("")
        case .old:
            print("")
        case .oldest:
            print("")
        }
        
    }
}

///

// PROTOCOLOS

protocol MyRules {
    var myAge: Int { get set }
    func giveMeMyBirthDay()
}

struct BirthDay: MyRules {
    
    var myAge: Int
    
    func giveMeMyBirthDay() {
        print(myAge)
        /*
         calcular, ir a un servicio, ir a internet
         */
    }
}

//var myBirthDay = BirthDay(myAge: 12)
//myBirthDay.giveMeMyBirthDay()
//myBirthDay.myAge = 20
//print(myBirthDay.myAge)

/*
 ¿por que me deja modificar si solo tiene get?
 */


// public, private, internal, fileprivate

protocol Person {
    var name: String { get set}
    var age: Int { get set}
    var rfc: String { get set }
    
    func isAlive()
}

struct Mexican: Person {
    
    var name: String
    
    var age: Int
    
    var rfc: String
    
    func isAlive() {
        print("si")
    }
}

/*
 Compara herencia en JAVA con Swift
 */

// Herencia - Swift no tiene herencia
// programacion orientada a protocolos
struct Peruan: Person {
    
    var name: String
    
    var age: Int
    
    var rfc: String
    
    func isAlive() {
        print("si")
    }
}


let andresPerson = Mexican(name: "Andres", age: 23, rfc: "212")
let rafaPerson = Mexican(name: "Rafael", age: 12, rfc: "oii")
let veronicaPerson = Peruan(name: "Veronica", age: 90, rfc: "312312")

func personProperties(person: Person) {
    print(person.age)
    print(person.rfc)
    print(person.name)
}

//personProperties(person: andresPerson)
//personProperties(person: rafaPerson)
//personProperties(person: veronicaPerson)

// Arreglos

var myArray: [Int] = [2, 3, 4 ,5]
                    //0, 1, 2, 3 ......
//print(myArray)
// agregar datos

myArray.append(23)
myArray.append(1)
myArray.append(90)

//print(myArray)

func removeElement(array: [Int], elementToRemove: Int) {
    
    for element in array {
        print(element == elementToRemove)
        // codigo, validaciones
    }
}

//removeElement(array: myArray, elementToRemove: 1)


// funciones de high order

//print(myArray.sorted())
//
//print(myArray.sorted(by: { $0 > $1 }))
//
//print(myArray.first(where: { $0 == 100 }))
//
//print(myArray.filter({ $0 < 10 }))

//myArray.forEach({ print($0)
    // codigo, validaciones
//})

// top de high order

// map
// castear, transformar

// Int -> String
// [Int] -> [String]

let myStringArray = myArray.map({ String($0) })
let myDoubleArray = myArray.map({ Double($0) })
//print(myDoubleArray)


// flatMap - compactMap
// modificar el elemento actual

let doubleArray = myArray.compactMap({ $0 * 2 })
//print(doubleArray)

//

//print(myArray.reduce(0, -))

// Diccionarios

let diccionario: [String: Any] = ["key": 123, "name": "pedro"]

// errores tipo typo
struct diccionariStruct {
    
    let key = 123
    let name = "pedro"
}

let newDict = diccionariStruct()
print(newDict.key)
print(diccionario["key"])
