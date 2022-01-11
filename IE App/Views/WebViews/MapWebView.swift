//
//  MapWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 11/01/2022.
//

import SwiftUI
import MapKit

struct MapWebView: View {
    
    @State private var selectedSegment = 0
    @State private var locations = [
        LocationItem(name: "IE Tower", coordinates: CLLocationCoordinate2D(latitude: 40.47765148539318, longitude: -3.689025013318373)),
        LocationItem(name: "Maria de Molina", coordinates: CLLocationCoordinate2D(latitude: 40.438175586639844, longitude: -3.6874198208608506)),
        LocationItem(name: "Segovia Campus", coordinates: CLLocationCoordinate2D(latitude: 40.95293012505374, longitude: -4.118850745369721))
        
    ]
    
    var body: some View {
        NavigationView{
            ZStack {
                MapView(coordinates: locations[selectedSegment].coordinates).ignoresSafeArea()
                GeometryReader { geo in
                    Rectangle().fill(Color.white.opacity(0.8)).frame(height:120).position(x:geo.size.width/2 ,y: 0)
                }
                VStack {
                    Picker("", selection: $selectedSegment) {
                        ForEach(0..<locations.count) {
                            Text(self.locations[$0].name).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.top)
                    Spacer()
                }
            }.navigationBarHidden(true)
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}


struct LocationItem {
    var name: String
    var coordinates: CLLocationCoordinate2D
}


struct MapView: UIViewRepresentable {
    var coordinates: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        view.setRegion(region, animated: true)
    }
}


struct MapWebView_Previews: PreviewProvider {
    static var previews: some View {
        MapWebView()
    }
}
