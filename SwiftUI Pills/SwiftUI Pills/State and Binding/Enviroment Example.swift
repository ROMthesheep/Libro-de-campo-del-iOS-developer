//
//  Enviroment Example.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 18/3/24.
//

import SwiftUI
import Observation

@Observable
class RoomState {
    var isLightOn: Bool = false
}

struct LightSwitch2: View {
    @Environment(RoomState.self) var roomState: RoomState
    var body: some View {
        
        @Bindable var roomState = roomState
        
        Toggle(roomState.isLightOn ? "ON" : "OFF", isOn: $roomState.isLightOn)
               }
}

struct LightSwitch: View {
    @Environment(RoomState.self) var roomState: RoomState
    var body: some View {
        Button("flick switch") {
            roomState.isLightOn.toggle()
            }
        }
}

struct Wall: View {
    var body: some View {
        LightSwitch()
        LightSwitch2()
    }
}

struct Room: View {
    @Environment(RoomState.self) var roomState: RoomState
    var body: some View {
        VStack {
            Wall()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(roomState.isLightOn ? .white : .black)
    }
}

#Preview {
    VStack {
        Room()
            .environment(RoomState())
        
    }
}
