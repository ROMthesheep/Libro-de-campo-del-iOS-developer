//
//  ReadingOrder.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 8/4/24.
//

import SwiftUI

struct ReadingOrderGood: View {
    var body: some View {
        VStack  {
            Text("Lenguajes de programacion mas usados segun github")
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityAddTraits(.isHeader)
                .fixedSize(horizontal: false, vertical: true)
            HStack(alignment: .top, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("2014").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Java")
                    Text("PHP")
                    Text("Python")
                    Text("Ruby")
                }.accessibilityElement(children: .contain)
                VStack(alignment: .leading) {
                    Text("2016").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Java")
                    Text("Python")
                    Text("PHP")
                    Text("C++")
                }.accessibilityElement(children: .contain)
                VStack(alignment: .leading) {
                    Text("2018").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Java")
                    Text("Python")
                    Text("PHP")
                    Text("C++")
                }.accessibilityElement(children: .contain)
                VStack(alignment: .leading) {
                    Text("2020").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Pyhon")
                    Text("Java")
                    Text("Ts")
                    Text("C#")
                }.accessibilityElement(children: .contain)
                VStack(alignment: .leading) {
                    Text("2022").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Pyhon")
                    Text("Java")
                    Text("Ts")
                    Text("C#")
                }.accessibilityElement(children: .contain)
            }.padding([.top, .bottom])
        }
    }
}

struct ReadingOrderBad: View {
    var body: some View {
        VStack  {
            Text("Lenguajes de programacion mas usados segun github")
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityAddTraits(.isHeader)
                .fixedSize(horizontal: false, vertical: true)
            HStack(alignment: .top, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("2014").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Java")
                    Text("PHP")
                    Text("Python")
                    Text("Ruby")
                }
                VStack(alignment: .leading) {
                    Text("2016").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Java")
                    Text("Python")
                    Text("PHP")
                    Text("C++")
                }
                VStack(alignment: .leading) {
                    Text("2018").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Java")
                    Text("Python")
                    Text("PHP")
                    Text("C++")
                }
                VStack(alignment: .leading) {
                    Text("2020").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Pyhon")
                    Text("Java")
                    Text("Ts")
                    Text("C#")
                }
                VStack(alignment: .leading) {
                    Text("2022").font(.headline).accessibilityAddTraits(.isHeader)
                    Text("JS")
                    Text("Pyhon")
                    Text("Java")
                    Text("Ts")
                    Text("C#")
                }
            }.padding([.top, .bottom])
        }
    }
}

struct ReadingOrder: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Accesibilidad bien configurada")
                .font(.title)
                .accessibilityAddTraits(.isHeader)
            Divider().padding()
            ReadingOrderGood()
            Text("Accesibilidad mal configurada")
                .font(.title)
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                .accessibilityAddTraits(.isHeader)
            Divider().padding()
            ReadingOrderBad()
        }.padding()
    }
}


#Preview {
    ReadingOrder()
}
