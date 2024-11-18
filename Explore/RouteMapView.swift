//// TODO : 1) What happens when you press play 2) save story template thing 3) recenter the map √  4) notifications 5) more mapkit features (?) 6) put numbers on the pins to indicate order 7) user tracking 8) icon 8) fix organisation medium √ 9) more locations + picture, description of each? 10) need dynamically update region and check 11) recenter map button √  12) app store collaterals 13) open to center 14) MAP DOESNT STRETCH FULLY VERTICALLY , BUTTONS NOT ALIGNED WHEN USE ACTUAL IPHONE?  15) how to break loop


import SwiftUI
import MapKit
import CoreLocation
import UserNotifications
import Forever


// LocationManager to handle location updates
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    // Published property to hold the current location
    @Published var currentLocation: CLLocation?
    
    override init() {
        super.init()
        
        // Set the delegate and start location updates
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // Request permission for location access
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters // Set accuracy
        locationManager.startUpdatingLocation() // Start receiving location updates
    }
    
    // CLLocationManagerDelegate method that gets called when location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location // Update the location
    }
    
    // Handle location errors or permission issues
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
    
    // Function to start location updates
    func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    // Function to stop location updates
    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }
    
}


struct RouteMapView: View {
    @State private var totalDistance: Double = 0.0
    @State private var polylines: [MKPolyline] = []
    
    @Binding var chosenLandmarks: [Location]
    
    @Forever("images") var images: [Data] = []
    
    
    
    
    @State private var isPlaying = false // Tracks if the button is in "playing" state
    
    
    
    
    @State private var mapCamera: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 1.2839, longitude: 103.8515),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    ))
    
    
    @State private var showCamera = false
    
    
    @State var backSheet = false
    
    let center = UNUserNotificationCenter.current()
    
    @State private var authorizationStatus: UNAuthorizationStatus?
    @AppStorage("allowCamera") var allowCamera = false
    
    @State private var isInitialLocationSet = false // Track initial centering
    
    @StateObject private var locationManager = LocationManager()
    @State var photoExportSheet = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                // Map view and polylines
                
                let location = locationManager.currentLocation
                
                Map(position: $mapCamera) {
                    UserAnnotation()
                    ForEach(chosenLandmarks) { location in
                        if location.name == "Current Location" {
                            // Use a unique icon for the current location
                            Annotation("Start/End", coordinate: location.coordinate, anchor: .bottom) {
                                Image(systemName: "location.circle.fill")
                                    .padding(6)
                                    .foregroundStyle(.yellow)
                                    .background(Color.black.opacity(0.6))
                                    .cornerRadius(8)
                            }
                        } else {
                            // Default icon for other landmarks
                            Annotation(location.name, coordinate: location.coordinate, anchor: .bottom) {
                                Image(systemName: "mappin.circle.fill")
                                    .padding(4)
                                    .foregroundStyle(.primary)
                                    .background(Color.red)
                                    .cornerRadius(4)
                            }
                        }
                    }
                    
                    if let location = locationManager.currentLocation {
                        Annotation("Your Location", coordinate:CLLocationCoordinate2D(latitude: location.coordinate.latitude,longitude: location.coordinate.latitude), anchor: .bottom) {
                            Image(systemName: "figure.walk")
                                .padding(4)
                                .foregroundStyle(.primary)
                                .background(Color.yellow)
                                .cornerRadius(4)
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
                    locationManager.startLocationUpdates()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        addCurrentLocationToChosenLandmarks()
                    }
                    if let currentLocation = locationManager.currentLocation {
                        mapCamera = .region(MKCoordinateRegion(center: currentLocation.coordinate, span: .init(latitudeDelta: 0.5, longitudeDelta: 0.5)))
                    }
                    calculateRouteDistance()
                }
                
                
                
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
                            isPlaying.toggle() // Toggle between play and pause
                            
                            if isPlaying {
                                // Play action
                                
                                // Allow for Location Based Notification
                                let locations = allLandmarks.map { $0.coordinate }
                                
                                locations.forEach { location in
                                    if authorizationStatus == .authorized || authorizationStatus == .provisional {
                                        // Triggers when within 50m from the location
                                        let region = CLCircularRegion(center: location, radius: 100.0, identifier: UUID().uuidString)
                                        region.notifyOnEntry = true
                                        region.notifyOnExit = false
                                        
                                        let content = UNMutableNotificationContent()
                                        content.title = "Exploro"
                                        content.subtitle = "You are near a landmark!"
                                        content.body = "Click the camera button to take a photo at the landmark!"
                                        content.sound = .default
                                        
                                        if let location = locationManager.currentLocation {
                                            region.contains(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude))
                                        }
                                        
                                        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
                                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                        let center = UNUserNotificationCenter.current()
                                        center.add(request)
                                    }
                                }
                            } else {
                                // Pause action - add any pause-specific logic here if needed
                            }
                        }) {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                                .frame(width: 80, height: 80)
                                .background(Circle().fill(Color(hex: "#9FC83E")))
                                .opacity(0.8)
                        }
                        
                        
                        // Recenter Button
                        Button(action: {
                            // Recenter the map to the user's current location
                            if let currentLocation = locationManager.currentLocation {
                                // Update the region's center using currentLocation
                                withAnimation {
                                    mapCamera = .region(MKCoordinateRegion(
                                        center: currentLocation.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                    ))
                                }
                            } else {
                                print("Current location not available")
                            }
                        }) {
                            Image(systemName: "location.fill")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black) // Black icon color
                                .frame(width: 60, height: 60)
                                .background(Circle().fill(Color(hex: "#9FC83E"))) // Green circle background
                                .opacity(0.8)
                        }
                        
                    }
                    .padding(.bottom, 20) // Optional padding for button row spacing
                }
                .task {
                    _ = try? await center.requestAuthorization(options: [.alert, .sound, .badge])
                    
                    let settings = await center.notificationSettings()
                    authorizationStatus = settings.authorizationStatus
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .overlay(alignment: .topLeading) {
                HStack{
                    NavigationLink {
                        VStack {
                            Spacer()
                            TabView{
                                ForEach(images, id: \.self) { data in
                                    Image(uiImage: UIImage(data: data) ?? UIImage())
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                }
                            }.tabViewStyle(.page)
                            
                            VStack{
                                Spacer()
                                Button{
                                    self.showCamera.toggle()
                                } label:{
                                    HStack{
                                        Image(systemName: "camera.shutter.button.fill")
                                        Text("Capture")
                                    }
                                    .padding()
                                    .background(Color(hex: "#9FC83E"))
                                    .cornerRadius(10)
                                    .padding()
                                    .foregroundStyle(.black)
                                    .fontWeight(.bold)
                                }
                                .fullScreenCover(isPresented: self.$showCamera) {
                                    accessCameraView(selectedImage: $images)
                                        .background(.black)
                                }
                            }
                        }
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
                    Spacer()
                    Button{
                        photoExportSheet = true
                    } label: {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.black)
                            .overlay {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .foregroundStyle(Color(hex: "#9FC83E"))
                            }
                    }
                    .fullScreenCover(isPresented: $photoExportSheet){
                        PhotoExport(images: $images)
                    }
                }
                .padding()
            }
            .onAppear {
                // Start updating location when the view appears
                locationManager.startLocationUpdates()  // Use the method from LocationManager
                
                // Check if currentLocation is available
                if let currentLocation = locationManager.currentLocation {
                    mapCamera = .region(MKCoordinateRegion(
                        center: currentLocation.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    ))
                    print("Region updated to user's current location on appear.")
                } else {
                    print("Current location not available on appear.")
                }
            }
            //            .onReceive(locationManager.$currentLocation) { newLocation in
            //                // Update the region whenever currentLocation changes
            //                guard let newLocation = newLocation else { return }
            //                region = MKCoordinateRegion(
            //                    center: newLocation.coordinate,
            //                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            //                )
            //                print("Region updated to new current location: \(newLocation.coordinate)")
            //            }
            .onDisappear {
                // Stop location updates when the view disappears to save battery
                locationManager.stopLocationUpdates()  // Use the method from LocationManager
            }
            
        }
    }
    
    func addCurrentLocationToChosenLandmarks() {
        guard !isInitialLocationSet, let currentLocation = locationManager.currentLocation else {
            print("Initial location is already set or not available.")
            return
        }
        
        let userLocation = Location(name: "Current Location", coordinate: currentLocation.coordinate)
        chosenLandmarks.insert(userLocation, at: 0)
        isInitialLocationSet = true
        print("Added user's location to chosenLandmarks: \(userLocation.coordinate)")
        calculateRouteDistance()
    }
    
    
    func calculateRouteDistance() {
        
        print(chosenLandmarks)
        print("Current Location: \(String(describing: locationManager.currentLocation))")
        print("Region center: \(String(describing: mapCamera.region?.center))")
        
        
        var requests = [MKDirections.Request]()
        
        if let currentLocation = locationManager.currentLocation {
            // Insert the current location at the beginning of chosenLandmarks
            chosenLandmarks.insert(Location(name: "Current Location", coordinate: currentLocation.coordinate), at: 0)
        }
        
        for i in 0..<chosenLandmarks.count {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: chosenLandmarks[i].coordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: chosenLandmarks[(i + 1) % chosenLandmarks.count].coordinate))
            request.transportType = .walking  // Set transportType on the individual request
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

struct accessCameraView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: [Data]
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

// Coordinator will help to preview the selected image in the View.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView
    
    init(picker: accessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        if let data = selectedImage.pngData(){
            self.picker.selectedImage.append(data)
            self.picker.isPresented.wrappedValue.dismiss()
        }
    }
}

#Preview{
    ContentView()
}
