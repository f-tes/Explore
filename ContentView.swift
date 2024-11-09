
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
        NavigationStack{
            ZStack {
                // Map with dynamic annotations
                Map(initialPosition: .region(region)) {
                    UserAnnotation()
        
                }

                .edgesIgnoringSafeArea(.all)
                
                // Control panel with search and toggles
                VStack {
                    Spacer()
                    Button{
                        isSheetPresented = true
                    }label:{
                        Text("Explore!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: "#9FC83E"))
                            .background(.black)
                            .cornerRadius(10)
                            .padding()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black.opacity(1.0))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
                .sheet(isPresented: $isSheetPresented) {
                    SheetView(chosenLandmarks: $chosenLandmarks)
                        .presentationDetents([.medium])
                }
            }
            .toolbar{
                ToolbarItem{
                    Button{
                        
                    }label:{
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.black)
                            .overlay{
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
}

// SheetView as a separate view to be shown in the sheet
struct SheetView: View {
    @Binding var chosenLandmarks: [Location]
    @State var searchText: String = ""

    var filteredLandmarks: [Location] {
        if searchText.isEmpty{
            return allLandmarks
        }else {
            return allLandmarks.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            // Search bar
            TextField("search", text: $searchText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Toggle switches for each landmark
            ScrollView{
                ForEach(filteredLandmarks, id: \.id) { landmark in
                    HStack {
                        Text("\(landmark.name)")
                            .foregroundColor(.black)
                        Spacer()
                        Toggle("", isOn: Binding(get: {
                            chosenLandmarks.contains(where: { $0.id == landmark.id })
                        }, set: { value in
                            if value {
                                chosenLandmarks.append(landmark)
                            } else {
                                let index = chosenLandmarks.firstIndex(where: { $0.id == landmark.id })
                                if let index {
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

            Button{
                
            }label:{
                Text("Continue")
                    .foregroundStyle(Color(hex: "#9FC83E"))

            }
        }
        .padding()
        .cornerRadius(15)
        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .bottom) // Limit height to 300 and align at bottom
        .padding(.horizontal, 20) // Add padding on sides to reduce the width
    }
}



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
