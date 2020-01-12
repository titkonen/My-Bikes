import Cocoa

var str = "Hello, playground"

print("str contains: \(str)")

var firstNumber = 5
var secondNumber = firstNumber
print("firstNumber contains \(firstNumber) and secondNumber contains \(secondNumber)")

secondNumber = 10
print("firstNumber contains \(firstNumber) and secondnumber contains \(secondNumber)")


struct PetValueType {
    var name: String = ""
    var species: String = ""
}

var pet1 = PetValueType()
pet1.name = "Fluffy"
pet1.species = "cat"
var pet2 = pet1
print("pet1: \(pet1.name) is a \(pet1.species)")
print("pet2: \(pet2.name) is a \(pet2.species)")

pet2.name = "Spot"
pet2.species = "dog"
print("pet1: \(pet1.name) is a \(pet1.species)")
print("pet2: \(pet2.name) is a \(pet2.species)")

class PetReferenceType {
    var name: String = ""
    var species: String = ""
}

var pet3 = PetReferenceType()
pet3.name = "Tonkatsu"
pet3.species = "pot-bellied pig"
var pet4 = pet3
print("pet3: \(pet3.name) is a \(pet3.species)")
print("pet4: \(pet4.name) is a \(pet4.species)")

pet4.name = "Sashimi"
pet4.species = "Goldfish"
print("pet3: \(pet3.name) is a \(pet3.species)")
print("pet4: \(pet4.name) is a \(pet4.species)")

