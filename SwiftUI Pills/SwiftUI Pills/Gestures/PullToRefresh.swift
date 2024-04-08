//
//  PullToRefresh.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

class CustomerListViewModel: ObservableObject {
    @Published var customers: [String] = []
    
    func fetch() {
        let names: [String] = ["Lucía" ,"Sofía" ,"Martina" ,"Valeria" ,"María" ,"Julia" ,"Paula" ,"Emma" ,"Olivia" , "Daniel" , "Carla" , "Alma" , "Mía" , "Carmen" , "Vega" , "Lola" , "Lara" , "Sara" , "Alba", "Jimena", "Martín", "Mateo", "Hugo", "Leo", "Lucas", "Manuel", "Alejandro", "Pablo", "Danie", "Álvaro", "Enzo", "Adrián", "Lucas", "Diego", "Thiago", "Mario", "Bruno", "David", "Olive", "Alex"]
        var output = [String]()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            for _ in 1...20 {
                output.append(names.randomElement() ?? "")
            }
            self.customers = output
        }
    }
}

struct PullToRefresh: View {
    
    @StateObject private var customerListVM = CustomerListViewModel()
    
    var body: some View {
        List(customerListVM.customers, id: \.self) { customer in
            Text(customer)
        }.onAppear {
            customerListVM.fetch()
        }.refreshable {
            customerListVM.fetch()
        }
    }
}

#Preview {
    PullToRefresh()
}
