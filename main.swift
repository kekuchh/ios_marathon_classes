class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
    func sound() {
        print("...")
    }
}

class Dog: Animal {
    override func sound() {
        print("Woof!")
    }
}

class Cat: Animal {
    override func sound() {
        print("Meow!")
    }
}

let cat = Cat(name: "Barsik")
cat.sound()

let dog=Dog(name: "Tasha")
dog.sound()

print("----------")
/* ---------- */

class House {
    var width: Double
    var height: Double

    init (width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    func create() {
        print("Area of the house: \(width * height)")
    }
    func destroy() {
        print("House has been destroyed!")
    }
}

let home=House(width: 352.0, height: 43.7)
home.create()
home.destroy()

print("----------")
/* ---------- */

struct Student {
    var name: String
    var age: Int
}

class SortByParametr {
    func sortByName(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.name < $1.name })
    }
    func sortByAge(students: [Student]) -> [Student] {
        return students.sorted(by: { $0.age < $1.age })
    }
}


var students = [Student]()

let student1 = Student(name: "Ivan", age: 22)
let student2 = Student(name: "Maria", age: 17)
let student3 = Student(name: "Nick", age: 20)

students.append(student1)
students.append(student2)
students.append(student3)

print("Original array of students:")
for student in students {
    print(student)
}

let sorter = SortByParametr()

students = sorter.sortByName(students: students)
print("Array of students sorted by name:")
for student in students {
    print(student)
}

students = sorter.sortByAge(students: students)
print("Array of students sorted by age:")
for student in students {
    print(student)
}

print("----------")
/* ---------- */

struct AnimalNew {
    var name: String
    var habitat: String

    func info() {
        print("I'm \(name) and I live in \(habitat)")
    }

}

class AnimalNewClass {
    var name: String
    var habitat: String

    init(name: String, habitat: String){
        self.name=name
        self.habitat=habitat
    }
    init(name: String){
        self.name=name
        self.habitat="Unknown"
    }

    func info() {
        print("I'm \(name) and I live in \(habitat)")
    }
}

let animal1=AnimalNew(name: "Cat", habitat: "people's hearths")
animal1.info()

let animal2=AnimalNewClass(name: "Dog")
animal2.info()

let animal3=AnimalNewClass(name: "Salmon", habitat: "water")
animal3.info()

// Структуры и классы отличаются:
// 1. Уровенем абстракции: Структуры обеспечивают более низкий уровень абстракции, чем классы. Они используются для создания объектов, состоящих из набора переменных и методов, в то время как классы обеспечивают более высокий уровень абстракции и используются для моделирования объектов с поведением и данными
// 2. Расположением в памяти: Структуры хранятся в стеке, объекты классов хранятся в куче
// 3. Деинициализицией: Классы обладают деинициализаторами, структуры - нет
// 4. Инициализацией: Структуры инициализируются автоматически, в то время как для классов необходимо явно вызывать инициализатор.