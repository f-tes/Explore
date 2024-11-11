// TODO : 1) check if route calculation is correct 2) debug 2) start map nearer 3) different map angles 4) sheet stuff 5) Generalise to different coordinates and all  6) exploit mapkit lookaround and all 7) combine all 8) beautify all  9) debug 10) get user location in real time 11) new app icon


import SwiftUI
import MapKit
import CoreLocation
import UserNotifications

struct RouteMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 1.2839, longitude: 103.8515),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var totalDistance: Double = 0.0
    @State private var polylines: [MKPolyline] = []
    
    @Binding var chosenLandmarks: [Location]
    
//    var locations: [Location] = [
//        Location(name: "Start / End", coordinate: CLLocationCoordinate2D(latitude: 1.2839, longitude: 103.8515)),
//        Location(name:"Landmark A", coordinate: CLLocationCoordinate2D(latitude: 1.2849, longitude: 103.8544)),
//        Location(name: "Landmark B", coordinate: CLLocationCoordinate2D(latitude: 1.2869, longitude: 103.8524))
//    ]
    
    @State var backSheet = false
    
    let center = UNUserNotificationCenter.current()
    
    @State private var authorizationStatus: UNAuthorizationStatus?
    
    var body: some View {
        ZStack {
            // Map view and polylines
            Map(initialPosition: .region(region)) {
                UserAnnotation()
                ForEach(chosenLandmarks) { location in
                    Annotation(location.name, coordinate: location.coordinate, anchor: .bottom) {
                        VStack {
                            if location.name == "Start / End" {
                                Image(systemName: "figure.walk")
                                    .padding(4)
                                    .foregroundStyle(.primary)
                                    .background(Color.yellow)
                                    .cornerRadius(4)
                            } else {
                                Image(systemName: "mappin.circle.fill")
                                    .padding(4)
                                    .foregroundStyle(.primary)
                                    .background(Color.red)
                                    .cornerRadius(4)
                            }
                        }
                    }
                }
                Group {
                    ForEach(polylines, id: \.self) { polyline in
                        MapPolyline(polyline)
                            .stroke(Color.orange, lineWidth: 8)
                    }
                }
            }
            .mapStyle(.standard(elevation: .realistic))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                calculateRouteDistance()
            }

         
            // UI components like distance and button
            // UI components like distance and button
            VStack {
                Spacer()
                VStack {
                    Text("Total Distance")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(totalDistance, specifier: "%.2f") km")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color(hex: "#9FC83E"))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.bottom, 2)
                
                // Circular button row with 3 buttons
                HStack(spacing: 20) {
                    // Back Button
                    Button(action: {
                        // TODO: Define the action to go back to ContentView
                        
                        backSheet = true
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black) // Black icon color
                            .frame(width: 60, height: 60)
                            .background(Circle().fill(Color(hex: "#9FC83E"))) // Green circle background
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

                    }
                    .fullScreenCover(isPresented: $backSheet) {
                        ContentView()
                    }
                    
                    // Play Button (larger and centered)
                    Button(action: {
                        // TODO: Define the action for play
                        
                        //Allow for Location Based Notification
                        let locations = allLandmarks.map({ $0.coordinate })
                        
                        locations.forEach { location in
                            if authorizationStatus == .authorized || authorizationStatus == .provisional {
                                
                                let content = UNMutableNotificationContent()
                                
                                content.title = "Exploro"
                                content.subtitle = "You are near a landmark!"
                                content.body = "Click the camera button to take a photo at the landmark!"
                                
                                content.sound = .default
                                
                                // Triggers when within 50m from the location
                                let region = CLCircularRegion(center: location, radius: 50.0, identifier: "Landmark")
                                
                                region.notifyOnEntry = true
                                region.notifyOnExit = false
                                
                                let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
                                
                                center.add(UNNotificationRequest(identifier: "Landmark",
                                                                 content: content,
                                                                 trigger: trigger))
                            }
                        }
                    }) {
                        Image(systemName: "play.fill")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black) // Black icon color
                            .frame(width: 80, height: 80)
                            .background(Circle().fill(Color(hex: "#9FC83E"))) // Green circle background
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

                    }
                    
                    
                    // Center Me Button
                    Button(action: {
                        // TODO: Define the action to center map on user location
                    }) {
                        Image(systemName: "location.fill")
                            .font(.title)
                            .bold()

                            .foregroundColor(.black) // Black icon color
                            .frame(width: 60, height: 60)
                            .background(Circle().fill(Color(hex: "#9FC83E"))) // Green circle background
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

                    }
                }
                .padding(.bottom, 20) // Optional padding for button row spacing
            }
            .task {
                _ = try? await center.requestAuthorization(options: [.alert, .sound, .badge])
                
                let settings = await center.notificationSettings()
                authorizationStatus = settings.authorizationStatus
            }
            .overlay(alignment: .topTrailing) {
                NavigationLink {
                    PhotoUploadView()
                } label: {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.black)
                        .overlay {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundStyle(Color(hex: "#9FC83E"))
                        }
                }
            }
        }
    }
    
    func calculateRouteDistance() {
        var requests = [MKDirections.Request]()
        
        for i in 0..<chosenLandmarks.count {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: chosenLandmarks[i].coordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: chosenLandmarks[(i + 1) % chosenLandmarks.count].coordinate))
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

#Preview{
    ContentView()
}
