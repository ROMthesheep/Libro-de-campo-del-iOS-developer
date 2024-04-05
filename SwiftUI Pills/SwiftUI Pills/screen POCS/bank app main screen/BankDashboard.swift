//
//  BankDashboard.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 3/4/24.
//

import SwiftUI

let bodyColor: Color = .white
let screenSize = UIScreen.main.bounds

struct BankDashboardHeaderBar: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
            Text("Hola Juan!")
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title)
        }.foregroundStyle(bodyColor)
    }
}

struct BankDashboardCard: View {
    
    let title: String
    let lastFour: String
    let amount: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                    Text("**** \(lastFour)")
                }
                .foregroundStyle(bodyColor)
                .padding()
                Spacer()
                Text(amount)
                    .padding()
                    .foregroundStyle(bodyColor)
                    .font(.largeTitle)
            }
            HStack {
                HStack(spacing: -10) {
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                        .foregroundStyle([Color.teal, Color.pink, Color.mint, Color.indigo].randomElement()!)
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                        .foregroundStyle([Color.teal, Color.pink, Color.mint, Color.indigo].randomElement()!)
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                        .foregroundStyle([Color.teal, Color.pink, Color.mint, Color.indigo].randomElement()!)
                    Image(systemName: "plus.circle")
                        .foregroundColor(bodyColor)
                        .font(.title)
                }.padding()
                Spacer()
                Text("VISA")
                    .padding()
                    .font(.largeTitle)
                    .foregroundStyle(bodyColor)
            }
        }
    }
}

struct BankDashboardCardAmounts: View {
    let cardTitle: String
    let cardAmount: String
    
    var body: some View {
        VStack {
            Text(cardTitle)
                .opacity(0.8)
            Text(cardAmount)
                .font(.largeTitle)
        }
        .foregroundStyle(bodyColor)
        .frame(width: screenSize.width/3, height: screenSize.height/6)
        .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
        .cornerRadius(16)
    }
}

struct AddNewCardModal: View {
    @Binding var showModal: Bool
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            Form {
                Section(header: Text("Introduce los detalles de la nueva tarjeta")
                    .padding()
                    .lineLimit(nil) ){
                        Toggle(isOn: .constant(true), label: {Text("Activar pagos por internet")})
                    }
            }
            .foregroundStyle(.black)
        }
    }
}

struct BankDashboard: View {
    
    @State private var isShown = false
    
    var body: some View {
        VStack {
            BankDashboardHeaderBar().padding()
            HStack(alignment: .center) {
                BankDashboardCardAmounts(cardTitle: "Balance total", cardAmount: "1.616€")
                BankDashboardCardAmounts(cardTitle: "Gasto mensual", cardAmount: "816€")
            }
            Spacer()
            
            ZStack {
                BankDashboardCard(title: "Tarjeta de debito", lastFour: "1230", amount: "12.301 €")
                    .frame(width: screenSize.width/1.05, height: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.994974196, green: 0.7454226017, blue: 0.5727493167, alpha: 1)), Color(#colorLiteral(red: 0.9985851645, green: 0.5965018868, blue: 0.3690588474, alpha: 1)),Color(#colorLiteral(red: 0.9988744855, green: 0.7611441016, blue: 0.5492826104, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                    .padding()
                    .offset(y: -200)
                
                BankDashboardCard(title: "Tarjeta virtual", lastFour: "1239", amount: "3.123 €")
                    .frame(width: screenSize.width/1.05, height: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.479896605, green: 0.3947715163, blue: 0.9015267491, alpha: 1)), Color(#colorLiteral(red: 0.7062470317, green: 0.4813869596, blue: 0.9368450642, alpha: 1)),Color(#colorLiteral(red: 0.8861602545, green: 0.6819390059, blue: 0.9643861651, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                    .padding()
                    .offset(y: -100)
                
                BankDashboardCard(title: "Tarjeta compartida", lastFour: "2609", amount: "10.344 €")
                    .frame(width: screenSize.width/1.05, height: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9875732064, green: 0.6546422839, blue: 0.8860223889, alpha: 1)), Color(#colorLiteral(red: 0.9795356393, green: 0.6155554652, blue: 0.7880486846, alpha: 1)),Color(#colorLiteral(red: 0.9874581695, green: 0.8551594615, blue: 0.7177419066, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                    .padding()
            }
            Button(action: {isShown.toggle()}, label: {
                HStack {
                    Text("Add card")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 22))
                }
            }).padding(20)
            .frame(width: screenSize.width - 40, height: 80)
            .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
            .cornerRadius(16)
            .sheet(isPresented: $isShown) {
                AddNewCardModal(showModal: $isShown)
            }
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.09886621684, green: 0.1093793288, blue: 0.2782805264, alpha: 1)))
            .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    BankDashboard()
}
