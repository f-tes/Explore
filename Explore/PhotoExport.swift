import SwiftUI
import Forever

// An example view to render
struct RenderView: View {
    let text: String
    @Binding var images: [Data]
    
    var body: some View {
//        Text(text)
//            .font(.title3)
//            .foregroundStyle(.black)
//            .padding()
//            .background(Color(hex: "#9FC83E"))
//            .frame(maxWidth: .infinity)
//            .multilineTextAlignment(.center)
//            .clipShape(Capsule())
        ForEach(images, id: \.self) { data in
            Image(uiImage: UIImage(data: data) ?? UIImage())
                .resizable()
                .scaledToFit()
                .frame(width: 300)
        }
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 190), spacing: -50)]) {
            ForEach(images, id: \.self) { data in
                Image(uiImage: UIImage(data: data) ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
        }
    }
}

struct PhotoExport: View {
    @State private var text = ""
    @State private var renderedImage = Image(systemName: "photo")
    @Environment(\.displayScale) var displayScale
    @Binding var images: [Data]
    @State var backSheet = false
    

    var body: some View {
        VStack {
            Spacer()
            renderedImage
            Spacer()
            ShareLink("Share", item: renderedImage, preview: SharePreview(Text("Shared image"), image: renderedImage))
            Button {
                backSheet = true
            } label: {
                Text("Continue")
                    .padding()
                    .background(Color(hex: "#9FC83E"))
                    .cornerRadius(10)
                    .padding()
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            }
            .fullScreenCover(isPresented: $backSheet) {
                ContentView()
            }
//            TextField("Enter some text", text: $text)
//                .textFieldStyle(.roundedBorder)
//                .padding()
        }
        .onChange(of: text) { _ in render() }
        .onAppear { render() }
    }

    @MainActor func render() {
        let renderer = ImageRenderer(content: RenderView(text: text, images: $images))

        // make sure and use the correct display scale for this device
        renderer.scale = displayScale

        if let uiImage = renderer.uiImage {
            renderedImage = Image(uiImage: uiImage)
        }
    }
}

#Preview{
    @Previewable @State var images: [Data] = []
    PhotoExport(images: $images)
}
