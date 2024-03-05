//: [Previous](@previous)

import Foundation

/**
 Utiliza el patrón Rule Engine cuando necesites de forma masiva hacer una accionncuando se den unas condiciones. Este diseño permite definir tareas complejas fuera de la logica principal.
 Es una herramienta poderosa para encapsular, aislar y proteger procesos ligados al tipo de input que se da sin exponerlo al dueño del mismo.
 El patron cuenta con tres partes diferenciadas, Las reglas, el motor y los datos.
La dinammica principal es, el motor mediante unas reglas ejecuta unna serie de procesos contra una entidad y devuelve el producto de ese  proceso.
 
 Los principales pros de este acercamiento son:
 Alto grado de mantenimiento
 Alto grado de flexibiidad
 Alto grado de reusabilidad
 Separacion clara de respponsabilidades
 Centralizacion de tareas
 */

struct Rule {
    let validate: (String) -> Bool
    let replace: () -> String
}

extension Rule {
    private static let wordsNotAllowed = ["insult1", "insult2", "insult3"]
    static let removeInsults = Rule { subject in
        wordsNotAllowed.contains(where: subject.contains)
    } replace: {
        // Do something to penalize the user
        "Message deleted by auto moderator"
    }}

protocol RuleEngine {
    func execute(with value: String) -> String
}

struct DemoRuleEngine: RuleEngine {
    let rules: [Rule]
    
    func execute(with value: String) -> String {
        var result = String()
        rules.forEach { rule in
            result = rule.validate(value) ? rule.replace() : value
        }
        return result
    }
}

let messages = ["Hi! how's your day going?",
                "Did you se that insult1 that was on the front door?",
                "she was making me crazy",
                "what an insult3"]
let ruleEngine = DemoRuleEngine(rules: [Rule.removeInsults])

messages.forEach { message in
    print(ruleEngine.execute(with: message))
}

//: [Next](@next)
