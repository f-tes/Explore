import SwiftUI

struct PhotoExport: View {
    @Binding var images: [Data]
    @State private var isSharing = false // State to handle sharing action
    @State private var isBack = false // To handle "Back" navigation
    @State private var collageImage: UIImage? // To hold the generated collage image

    let columns = [
        GridItem(.flexible()), // 1st column
        GridItem(.flexible())  // 2nd column
    ]
    
    var body: some View {
        VStack {
            // Photo Grid (no ScrollView)
            LazyVGrid(columns: columns, spacing: 0) { // Set spacing to 0 to remove gaps
                ForEach(images, id: \.self) { imageData in
                    if let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()  // Keep aspect ratio intact
                            .frame(width: calculateImageWidth(), height: calculateImageWidth()) // Standardized width and height
                            .clipped() // Ensure the image doesn't overflow its frame
                    }
                }
            }
            .padding([.leading, .trailing]) // Padding only on the sides
            
            Spacer() // To ensure buttons stay at the bottom
            
            // Share and Back buttons
            VStack {
                // Share button
                Button(action: shareCollage) {
                    HStack {
                        Image(systemName: "square.and.arrow.down")
                        Text("Save to photos")
                            .padding()
                    }
                }
                .padding(.horizontal)
                
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
                .padding(.horizontal)
            }
            .padding(.bottom, 20) // To provide some bottom margin
        }
        .navigationBarHidden(true) // Hide navigation bar when inside this view
        .onAppear {
            createCollage() // Generate the collage image when the view appears
        }
    }
    
//    // Function to calculate the width of each image based on the available space
//    private func calculateImageWidth() -> CGFloat {
//        let screenWidth = UIScreen.main.bounds.width
//        let totalPadding: CGFloat = 10 * 3 // Adjust for horizontal spacing between columns (1 space between, 2 padding on the sides)
//        let imageWidth = (screenWidth - totalPadding) / 2 // Divide by 2 for two columns
//        return imageWidth
//    }
    
//    // Function to calculate the height of each image based on the available vertical space
//    private func calculateImageHeight() -> CGFloat {
//        let screenHeight = UIScreen.main.bounds.height
//        let buttonHeight: CGFloat = 100 // Account for buttons and padding
//        let availableHeight = screenHeight - buttonHeight - 40 // Reserve space for other UI elements
//        
//        let numRows = CGFloat(images.count / 2 + (images.count % 2 != 0 ? 1 : 0)) // Number of rows needed
//        return availableHeight / numRows // Evenly distribute height for rows
//    }
    private func calculateImageSize() -> CGSize {
        // Get screen width and height
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let totalPadding: CGFloat = 10 * 3 // Adjust for horizontal spacing (1 space between, 2 padding on the sides)
        
        // Calculate the width of each image
        let imageWidth = (screenWidth - totalPadding) / 2 // Divide by 2 for two columns

        // Calculate the height of each image based on the aspect ratio
        let availableHeight = screenHeight - 100 - 40 // Account for buttons and padding
        let numRows = CGFloat(images.count / 2 + (images.count % 2 != 0 ? 1 : 0)) // Number of rows needed
        let imageHeight = availableHeight / numRows // Height based on the number of rows

        // Return width and height of the image to preserve aspect ratio
        return CGSize(width: imageWidth, height: imageHeight)
    }

    private func calculateImageWidth() -> CGFloat {
        return calculateImageSize().width
    }

    private func calculateImageHeight() -> CGFloat {
        return calculateImageSize().height
    }

    
    // Function to generate the collage image from the array of images
    private func createCollage() {
        let uiImages = images.compactMap { UIImage(data: $0) }
        
        // Calculate the size of the collage (we'll arrange images in a grid of 2 columns)
        let collageWidth = calculateImageWidth() * 2 // 2 columns
        let collageHeight = calculateImageHeight() * CGFloat((uiImages.count / 2) + (uiImages.count % 2 != 0 ? 1 : 0)) // Calculate rows
        
        // Create a new blank image context with the calculated size
        UIGraphicsBeginImageContextWithOptions(CGSize(width: collageWidth, height: collageHeight), false, 0)
        
        // Draw each image in the context to create a grid
        for (index, image) in uiImages.enumerated() {
            let x = CGFloat(index % 2) * calculateImageWidth()
            let y = CGFloat(index / 2) * calculateImageHeight()
            image.draw(in: CGRect(x: x, y: y, width: calculateImageWidth(), height: calculateImageHeight()))
        }
        
        // Capture the final collage image
        if let collage = UIGraphicsGetImageFromCurrentImageContext() {
            collageImage = collage
        }
        
        UIGraphicsEndImageContext()
    }
    
    // Function to share the collage using ShareLink
    private func shareCollage() {
        guard let collageImage = collageImage else { return }
        
        // Convert the UIImage to an Image view for ShareLink
        let collageImageView = Image(uiImage: collageImage)
        
        // ShareLink with preview (using the image view and a description)
        ShareLink(item: collageImageView, preview: SharePreview("Photo Collage", image: collageImageView)) {
            Label("Save to Photos", systemImage: "square.and.arrow.down")
        }
        
        // Save the image to the Photos library
        UIImageWriteToSavedPhotosAlbum(collageImage, nil, nil, nil)
        
        // Optionally, set `isSharing` to true to show sharing state
        isSharing = true
    }
}

#Preview {
    @Previewable @State var images: [Data] = []
    PhotoExport(images: $images)
}
