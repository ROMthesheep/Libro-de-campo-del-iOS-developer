//
//  ContentView.swift
//  MobileBankApp
//
//  Created by Mohammad Azam on 10/7/20.
//

import SwiftUI

struct Card: View {
    
    let title: String
    let lastFour: String
    let amount: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(Color.white)
                    Text("**** \(lastFour)")
                        .foregroundColor(Color.white)
                }.padding()
                Spacer()
                Text(amount).padding()
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
            }
            
            HStack {
                HStack(spacing: -10) {
                    Image("face")
                        .resizable()
                        .frame(width: 44, height: 44)
                    
                    Image("face")
                        .resizable()
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: "plus.circle")
                                           .foregroundColor(.white)
                                           .opacity(0.5)
                                           .font(.system(size: 35))
                }
                
                Spacer()
                Text("Visa").padding()
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "Private card", lastFour: "3456", amount: "$10,456")
    }
}




struct ContentViewa: View {
        
    let size = UIScreen.main.bounds

    var body: some View {
        VStack {
            HStack {
                Image("face")
                    .resizable()
                    .frame(width: 75, height: 75)
                
                Text("Hi Jane!")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Image(systemName: "bell.badge")
                    .font(.title)
                    .foregroundColor(Color.white)
            }.padding()
            
            HStack(alignment: .center) {
                
                VStack {
                    Text("Total Balance")
                        .opacity(0.5)
                        .foregroundColor(Color.white)
                    Text("$15,269")
                        .foregroundColor(Color.white)
                        .font(.title)
                }.frame(width: size.width/2.2, height: size.height/6)
                .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                .cornerRadius(16)
                
                VStack {
                    Text("Monthly Spending")
                        .opacity(0.5)
                        .foregroundColor(Color.white)
                    Text("$7,175")
                        .foregroundColor(Color.white)
                        .font(.title)
                }.frame(width: size.width/2.2, height: size.height/6)
                .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
                .cornerRadius(16)
                
            }
            
            Spacer()
            
            // Card control here
            ZStack {
                Card(title: "Salary card", lastFour: "4567", amount: "$5537")
                    .frame(width: size.width, height: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.994974196, green: 0.7454226017, blue: 0.5727493167, alpha: 1)), Color(#colorLiteral(red: 0.9985851645, green: 0.5965018868, blue: 0.3690588474, alpha: 1)),Color(#colorLiteral(red: 0.9988744855, green: 0.7611441016, blue: 0.5492826104, alpha: 1))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .cornerRadius(30)
                    .padding()
                    .offset(y: -200)
                
                Card(title: "Private card", lastFour: "3456", amount: "$12,345")
                    .frame(width: size.width, height: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.479896605, green: 0.3947715163, blue: 0.9015267491, alpha: 1)), Color(#colorLiteral(red: 0.7062470317, green: 0.4813869596, blue: 0.9368450642, alpha: 1)),Color(#colorLiteral(red: 0.8861602545, green: 0.6819390059, blue: 0.9643861651, alpha: 1))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .cornerRadius(30)
                    .padding()
                    .offset(y: -100)
                
                Card(title: "Family Card", lastFour: "2616", amount: "15,269")
                    .frame(width: size.width, height: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9875732064, green: 0.6546422839, blue: 0.8860223889, alpha: 1)), Color(#colorLiteral(red: 0.9795356393, green: 0.6155554652, blue: 0.7880486846, alpha: 1)),Color(#colorLiteral(red: 0.9874581695, green: 0.8551594615, blue: 0.7177419066, alpha: 1))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .cornerRadius(30)
                    .padding()
            }
            
            Button(action: {}, label: {
                HStack {
                    Text("Add card")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 22))
                }
            }).padding(20)
            .frame(width: size.width - 40, height: 80)
            .background(Color(#colorLiteral(red: 0.1695919633, green: 0.164103806, blue: 0.3997933269, alpha: 1)))
            .cornerRadius(16)
            
            
            
        }.padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.09886621684, green: 0.1093793288, blue: 0.2782805264, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewa()
    }
}

