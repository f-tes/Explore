import SwiftUI
import MapKit

// Main ContentView with map and control panel
struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 1.2867, longitude: 103.853),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    @State var chosenLandmarks: [Location] = []
    
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    // Map with dynamic annotations
                    Map(initialPosition: .region(region)) {
                        UserAnnotation()
                        
                        // Display chosen landmarks with annotations
                        ForEach(chosenLandmarks) { location in
                            Annotation(location.name, coordinate: location.coordinate, anchor: .bottom) {
                                VStack {
                                    // Conditional icon display
                                    if location.name == "Start / End" {
                                        Image(systemName: "figure.walk")
                                            .padding(4)
                                            .foregroundStyle(.white)
                                            .background(Color.yellow)
                                            .cornerRadius(4)
                                    } else {
                                        Image(systemName: "star.fill")
                                            .padding(4)
                                            .foregroundStyle(.white)
                                            .background(Color.red)
                                            .cornerRadius(4)
                                            .font(.headline)  // Large system font size

                                    }
                                    
                                    Text(location.name)
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .mapStyle(.standard(elevation: .realistic))
                    .edgesIgnoringSafeArea(.all) // Makes the map stretch across the entire screen
                }

                VStack {
                    Spacer() // Pushes the button to the bottom
                    Button {
                        isSheetPresented = true
                    } label: {
                        Text("Explore!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: "#9FC83E"))
                            .cornerRadius(10)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
                .sheet(isPresented: $isSheetPresented) {
                    SheetView(chosenLandmarks: $chosenLandmarks)
                        .presentationDetents([.medium])
                }
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    // Action for the camera button
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
}

// SheetView as a separate view to be shown in the sheet
struct SheetView: View {
    @Binding var chosenLandmarks: [Location]
    @State var searchText: String = ""
    
    var filteredLandmarks: [Location] {
        if searchText.isEmpty {
            return allLandmarks
        } else {
            return allLandmarks.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        }
    }
    
    @State var routeMapSheet = false
    
    var body: some View {
        VStack() {
            // Search bar
            TextField("Search", text: $searchText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
            
            // Toggle switches for each landmark
            ScrollView {
                ForEach(filteredLandmarks, id: \.id) { landmark in
                    HStack {
                        Text("\(landmark.name)")
                        Spacer()
                        Toggle("", isOn: Binding(get: {
                            chosenLandmarks.contains(where: { $0.id == landmark.id })
                        }, set: { value in
                            if value {
                                chosenLandmarks.append(landmark)
                            } else {
                                if let index = chosenLandmarks.firstIndex(where: { $0.id == landmark.id }) {
                                    chosenLandmarks.remove(at: index)
                                }
                            }
                        }))
                        .labelsHidden()
                    }
                    .padding()
                    .cornerRadius(10)
                }
            }
            
            Button {
                routeMapSheet = true
            } label: {
                Text("Continue")
                    .padding()
                    .background(Color(hex: "#9FC83E"))
                    .cornerRadius(10)
                    .padding()
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            }
            .fullScreenCover(isPresented: $routeMapSheet) {
                RouteMapView(chosenLandmarks: $chosenLandmarks)
            }

        }
    }
}

// Extension for creating custom colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let rgbValue = UInt32(hex, radix: 16)
        let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue! & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

#Preview{
    ContentView()
}
