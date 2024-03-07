//: [Previous](@previous)

import Foundation
/**
 El patrón Coordinator es un patrón de diseño estructural que busca delegar la responsabilidad del flujo de navegación de los controladores de vista a un objeto dedicado llamado Coordinator. Un Coordinator es una entidad que controla el flujo de la aplicación, decidiendo cuándo presentar y descartar controladores de vista. Se encarga de la lógica de navegación de la aplicación, que incluye no solo la presentación de pantallas, sino también la gestión de los datos que se pasan entre ellas.
 
 Este código no escala bien, las funcionalidades están entrelazadas y están bloqueadas entre sí. Vamos a aplicar el patrón Coordinator para desacoplar la lógica pesada y común para asegurar la correcta escalabilidad del proyecto. Aquí tenemos el código antes de aplicar el patrón.
 
class View {
    let items: [Any]
 
    // do something
 
     func pushView() {
         // does the thing
     }
    
    func navigateToSomePlace() {
        print("Byeeeee")
    }
}

class ViewDelegate {
    // do something
}

extension View: ViewDelegate {
    func itemWasSelected(selected: IndexPath) {
        let selectedItem = items[selected.row]
        
        // do something
        
        navigateToSomePlace()
    }
}
*/
class View {
    let items: [Any]
    weak var coordinator: Coordinator?
    // do something
    
    func pushView(view: View) {
        // does the thing
    }
    
    func navigateToSomePlace() {
        print("Byeeeee")
    }
}

class ViewDelegate {
    // do something
}

extension View: ViewDelegate {
    func itemWasSelected(selected: IndexPath) {
        let selectedItem = items[selected.row]
        
        // do something
        
        coordinator?.navigate()
    }
}

class Coordinator {
    var view = View()
    
    func start() {
        let initialView = View()
        initialView.coordinator = self
        view.pushView(view: initialView)
    }
    
    func navigate() {
        // do something
        
        view.navigateToSomePlace()
    }
}
//: [Next](@next)
