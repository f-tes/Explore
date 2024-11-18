import SwiftUI

// An example view to render
struct RenderView: View {
    
    let columns = [
        GridItem(.flexible()), // 1st column
        GridItem(.flexible())  // 2nd column
    ]
    
    var images: [Data]
        
    var body: some View {
        // Photo Grid (no ScrollView)
        LazyVGrid(columns: columns, spacing: 0) { // Set spacing to 0 to remove gaps
            ForEach(images, id: \.self) { imageData in
                if let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()  // Keep aspect ratio intact
                        .frame(width: 200, height: 200) // Standardized width and height
                        .clipped() // Ensure the image doesn't overflow its frame
                }
            }
        }
        .padding([.leading, .trailing]) // Padding only on the sides
    }
}

struct PhotoExport: View {
    @Binding var images: [Data]
    @State private var isSharing = false // State to handle sharing action
    @State private var isBack = false // To handle "Back" navigation
    
    @State private var text = ""
    @State private var renderedImage = Image(systemName: "")
    @Environment(\.displayScale) var displayScale

    var body: some View {
        VStack {
            Spacer()
            renderedImage
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            ShareLink("Export", item: renderedImage, preview: SharePreview(Text("Shared image"), image: renderedImage))
            
            // End button (Back button)
            Button {
                // Set `isBack` to true to trigger navigation
                isBack = true
                images = [] // Clear images
            } label: {
                Text("End")
                    .padding()
                    .background(Color(hex: "#9FC83E"))
                    .cornerRadius(10)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            }
            .fullScreenCover(isPresented: $isBack) {
                ContentView() // Replace this with your home or previous view
            }

        }
        .onChange(of: text) { _ in render() }
        .onAppear { render() }
    }

    @MainActor func render() {
        let renderer = ImageRenderer(content: RenderView(images: images))

        // make sure and use the correct display scale for this device
        renderer.scale = displayScale

        renderer.render { size, context in
        }
        if let uiImage = renderer.uiImage {
            renderedImage = Image(uiImage: uiImage)
        }
    }
}

#Preview{
    @Previewable @State var images: [Data] = []
    PhotoExport(images: $images)
}
