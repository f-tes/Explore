////
////  PhotoUploadView.swift
////  Explore
////
////  Created by Javius Loh on 11/11/24.
////
//
//import SwiftUI
//import PhotosUI
//import Forever
//
//struct PhotoUploadView: View {
//    @State private var showCamera = false
//
//    @Binding var images: [Data]
//    var body: some View {
//        VStack {
//            Text("\(images.count)")
//            TabView{
//                ForEach(images, id: \.self) { data in
//                    Image(uiImage: UIImage(data: data) ?? UIImage())
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 300)
//                }
//            }.tabViewStyle(.page)
//            
//            VStack{
//                Spacer()
//                Button{
//                    self.showCamera.toggle()
//                } label:{
//                    HStack{
//                        Image(systemName: "camera.shutter.button.fill")
//                        Text("Capture")
//                    }
//                    .padding()
//                    .background(Color(hex: "#9FC83E"))
//                    .cornerRadius(10)
//                    .padding()
//                    .foregroundStyle(.black)
//                    .fontWeight(.bold)
//                }
//                .fullScreenCover(isPresented: self.$showCamera) {
//                    accessCameraView(selectedImage: $images)
//                        .background(.black)
//                }
//            }
//        }
////        .overlay (alignment: .topTrailing){
////            Button{
////                images = []
////            } label:{
////                Image(systemName: "trash.fill")
////                    .padding()
////            }
////            .padding()
////        }
//    }
//}
//
//struct accessCameraView: UIViewControllerRepresentable {
//    
//    @Binding var selectedImage: [Data]
//    @Environment(\.presentationMode) var isPresented
//    
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .camera
//        imagePicker.allowsEditing = true
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//    
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//        
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(picker: self)
//    }
//}
//
//// Coordinator will help to preview the selected image in the View.
//class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    var picker: accessCameraView
//    
//    init(picker: accessCameraView) {
//        self.picker = picker
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let selectedImage = info[.originalImage] as? UIImage else { return }
//        if let data = selectedImage.pngData(){
//            self.picker.selectedImage.append(data)
//            self.picker.isPresented.wrappedValue.dismiss()
//        }
//    }
//}
//
//#Preview {
//    PhotoUploadView(images: .constant([]))
//}
