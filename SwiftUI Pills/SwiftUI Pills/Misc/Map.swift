//
//  Map.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 27/3/24.
//

import SwiftUI
import MapKit

struct Mapview: View {
    
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.712837, longitude: -4.295221), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta:  0.1)))
    
    var body: some View {
        Map(position: $position)
    }
}

#Preview {
    Mapview()
}
