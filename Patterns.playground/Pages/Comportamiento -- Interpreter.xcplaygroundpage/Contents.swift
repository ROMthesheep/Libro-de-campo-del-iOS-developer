//: [Previous](@previous)

import Foundation

/**
 El Patrón de Diseño Interpreter es un patrón de diseño conductual que define una manera de evaluar la gramática de un lenguaje. Te ayuda a crear un lenguaje simple para tu aplicación o a evaluar expresiones basadas en una gramática específica.

 Imagina que estás construyendo una aplicación de calculadora que evalúa expresiones aritméticas. Las expresiones pueden incluir números, operadores de adición, sustracción, multiplicación y división. Para evaluar estas expresiones, necesitas analizarlas e interpretarlas de acuerdo con las reglas aritméticas.

 El Patrón de Diseño Interpreter ofrece una solución para evaluar expresiones definiendo una gramática para el lenguaje y creando un intérprete para evaluar las expresiones basadas en esta gramática.
 El patrón implica la creación de un árbol de sintaxis abstracta (AST) que representa la expresión. Cada nodo del árbol representa una regla de gramática o un elemento del lenguaje. El intérprete recorre el árbol y evalúa la expresión aplicando las reglas de gramática.
 */

protocol Expression {
    func interpret() -> Double
}

class Number: Expression {
    let value: Double

    init(_ value: Double) {
        self.value = value
    }

    func interpret() -> Double {
        value
    }
}

class Add: Expression {
    let leftExpression: Expression
    let rightExpression: Expression

    init(_ left: Expression, _ right: Expression) {
        leftExpression = left
        rightExpression = right
    }

    func interpret() -> Double {
        leftExpression.interpret() + rightExpression.interpret()
    }
}

class Subtraction: Expression {
    let leftExpression: Expression
    let rightExpression: Expression

    init(_ left: Expression, _ right: Expression) {
        leftExpression = left
        rightExpression = right
    }

    func interpret() -> Double {
        leftExpression.interpret() - rightExpression.interpret()
    }
}

class Multiplication: Expression {
    let leftExpression: Expression
    let rightExpression: Expression

    init(_ left: Expression, _ right: Expression) {
        leftExpression = left
        rightExpression = right
    }

    func interpret() -> Double {
        leftExpression.interpret() * rightExpression.interpret()
    }
}

class Division: Expression {
    let leftExpression: Expression
    let rightExpression: Expression

    init(_ left: Expression, _ right: Expression) {
        leftExpression = left
        rightExpression = right
    }

    func interpret() -> Double {
        leftExpression.interpret() / rightExpression.interpret()
    }
}

let operation: Expression = Division(
    Multiplication(Number(1), Number(2)),
    Add(Number(3), Number(5))
)

print("Result: \(operation.interpret())")

//: [Next](@next)
