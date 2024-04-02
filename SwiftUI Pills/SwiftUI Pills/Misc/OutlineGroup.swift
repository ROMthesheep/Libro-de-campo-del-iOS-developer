//
//  OutlineGroup.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 1/4/24.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem]?
}

extension MenuItem {
    static func getMenu() -> [MenuItem] {
        let espressoMachineMenuItems = [ MenuItem(name: "Leva", image: "leva-x", subMenuItems: [ MenuItem(name: "Leva X", image: "leva-x"), MenuItem(name: "Leva S", image: "leva-s") ]),
                                         MenuItem(name: "Strada", image: "strada-ep", subMenuItems: [ MenuItem(name: "Strada EP", image: "strada-ep"), MenuItem(name: "Strada AV", image: "strada-av"), MenuItem(name: "Strada MP", image: "strada-mp"), MenuItem(name: "Strada EE", image: "strada-ee") ]),
                                         MenuItem(name: "KB90", image: "kb90"),
                                         MenuItem(name: "Linea", image: "linea-pb-x", subMenuItems: [ MenuItem(name: "Linea PB X", image: "linea-pb-x"), MenuItem(name: "Linea PB", image: "linea-pb"), MenuItem(name: "Linea Classic", image: "linea-classic") ]),
                                         MenuItem(name: "GB5", image: "gb5"),
                                         MenuItem(name: "Home", image: "gs3", subMenuItems: [ MenuItem(name: "GS3", image: "gs3"), MenuItem(name: "Linea Mini", image: "linea-mini") ])
                                        ]

        
        let grinderMenuItems = [ MenuItem(name: "Swift", image: "swift"),
                                 MenuItem(name: "Vulcano", image: "vulcano"),
                                 MenuItem(name: "Swift Mini", image: "swift-mini"),
                                 MenuItem(name: "Lux D", image: "lux-d")
                                ]

        
        let otherMenuItems = [ MenuItem(name: "Espresso AV", image: "espresso-av"),
                                 MenuItem(name: "Espresso EP", image: "espresso-ep"),
                                 MenuItem(name: "Pour Over", image: "pourover"),
                                 MenuItem(name: "Steam", image: "steam")
                                ]
        
        return [ MenuItem(name: "Espresso Machines", image: "linea-mini", subMenuItems: espressoMachineMenuItems),
                                MenuItem(name: "Grinders", image: "swift-mini", subMenuItems: grinderMenuItems),
                                MenuItem(name: "Other Equipment", image: "espresso-ep", subMenuItems: otherMenuItems)
                            ]
    }
}

struct SimpleList: View {
    var body: some View {
        List(MenuItem.getMenu(), children: \.subMenuItems) { item in
            HStack {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)

                Text(item.name)
                    .font(.system(.title3, design: .rounded))
                    .bold()
            }
        }.listStyle(.plain)
    }
}

struct OutlineGroupView: View  {
    var body: some View {
        List {
            OutlineGroup(MenuItem.getMenu(), children: \.subMenuItems) {  item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)

                    Text(item.name)
                        .font(.system(.title3, design: .rounded))
                        .bold()
                }
            }
        }
    }
}

#Preview {
    VStack {
        Text("Simple List").font(.largeTitle)
        SimpleList()
        Text("OutlineGroup").font(.largeTitle)
        OutlineGroupView()
    }
}
