//
//  CreditCard.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 2/4/24.
//

import SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View {
    
    let name: String
    let expires: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.white)
                Spacer()
                Text("VISA")
                    .foregroundStyle(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
            Spacer()
            Text("**** **** **** 2864")
                .foregroundStyle(.white)
                .font(.system(size: 32))
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("CARD HOLDER")
                    Text(name)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("EXPIRATION DATE")
                    Text(expires)
                }
            }.font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }.frame(width: 300, height: 200)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 130/255, green: 25/255, blue: 120/255), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
}

struct CreditCardBack: View {
    
    let cvv: String
    
    var body: some View {
        VStack {
           
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding([.top])

            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 15) {
                    HStack(alignment: .top) {
                        Text(cvv).foregroundColor(Color.black)
                            .padding(5)
                            .frame(width: 60, height: 20)
                            .background(Color.white)
                        Text("CVV").foregroundColor(Color.white)
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "leaf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30,height: 30)
                            .foregroundStyle(.white)
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(width: 2,height: 25)
                        Text("Card produced with 99% recycled plastics")
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundStyle(.white)
                            .font(.caption)
                    }
                }
                Spacer()
                Image(systemName: "building.columns")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.white)
            }
            .padding([.bottom,.leading,.trailing])
            .padding(.top,3)
            Spacer()
            HStack {
                Image(systemName: "lock.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15)
                    .foregroundStyle(.white)
                Text("Secure\nCard")
                    .font(.system(size: 9))
                Spacer()
                Text("This card is personal and non-transferable. In case of loss or damage, please contact the bank")
                    .font(.system(size: 9))
                Spacer()
                Image(systemName: "trash.slash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15)
                    .foregroundStyle(.white)
                Image(systemName: "globe.europe.africa.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15)
                    .foregroundStyle(.white)
            }
            .font(.caption)
            .padding([.bottom], 8)
            .padding([.leading, .trailing], 10)
            .foregroundStyle(.white)
        }.frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue,Color(red: 130/255, green: 25/255, blue: 120/255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

#Preview {
    CreditCard<CreditCardBack>(content: {CreditCardBack(cvv: "987")})
}
