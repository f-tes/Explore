// TODO : 1) check if route calculation is correct 2) debug 2) start map nearer 3) different map angles 4) sheet stuff 5) Generalise to different coordinates and all  6) exploit mapkit lookaround and all 7) combine all 8) beautify all  9) debug


import SwiftUI
import MapKit


struct RouteMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 1.2839, longitude: 103.8515), //to make this generalisable
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var totalDistance: Double = 0.0
    @State private var polylines: [MKPolyline] = []
    
    let locations: [Location] = [
        Location(name: "Start / End", coordinate: CLLocationCoordinate2D(latitude: 1.2839, longitude: 103.8515)),
        Location( name: "Landmark A", coordinate: CLLocationCoordinate2D(latitude: 1.2849, longitude: 103.8544)),
        Location(name: "Landmark B", coordinate: CLLocationCoordinate2D(latitude: 1.2869, longitude: 103.8524))
    ]
    
    var body: some View {
        ZStack {
            Map(initialPosition: .region(region)) {
                UserAnnotation()
                ForEach(locations){ location in
                    Annotation(location.name, coordinate: location.coordinate, anchor: .bottom) {
                        VStack {
                            if location.name == "Start / End" {
                                Image(systemName: "figure.walk")
                                    .padding(4)
                                    .foregroundStyle(.white)
                                    .background(Color.yellow)
                                    .cornerRadius(4)
                            } else {
                                Image(systemName: "mappin.circle.fill")
                                    .padding(4)
                                    .foregroundStyle(.white)
                                    .background(Color.red)
                                    .cornerRadius(4)
                            }
                            Text(location.name)
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                }
                Group {
                    ForEach(polylines, id: \.self) { polyline in
                        MapPolyline(polyline)
                            .stroke(Color.blue, lineWidth: 6)
                    }
                }
            }
            //            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locations) { location in
            //
            .mapStyle(.standard(elevation: .realistic))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                calculateRouteDistance()
            }
            
            VStack {
                Spacer()
                VStack {
                    Text("Total Distance")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(totalDistance, specifier: "%.2f") km")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
    }
    
    func calculateRouteDistance() {
        var requests = [MKDirections.Request]()
        
        for i in 0..<locations.count {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: locations[i].coordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: locations[(i + 1) % locations.count].coordinate))
            requests.append(request)
        }
        
        var distanceTotal = 0.0
        let group = DispatchGroup()
        
        for request in requests {
            group.enter()
            let directions = MKDirections(request: request)
            
            directions.calculate { response, error in
                if let error = error {
                    print("Error calculating directions: \(error.localizedDescription)")
                    group.leave()
                    return
                }
                
                if let route = response?.routes.first {
                    distanceTotal += route.distance
                    self.polylines.append(route.polyline) // Add polyline for visual representation
                }
                
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.totalDistance = distanceTotal / 1000.0 // Convert to km
        }
    }
}

struct StartView: View {
    var body: some View {
        RouteMapView()
    }
}
