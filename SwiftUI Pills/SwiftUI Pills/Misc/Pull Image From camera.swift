//
//  Pull Image From camera.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 22/3/24.
//

import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { 
            isShown = false
            return }
        image = Image(uiImage: uiImage)
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
         
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            return picker
    }
}

struct PhotoCaptureView: View {
    
    @Binding var showingSheet: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePicker(isShown: $showingSheet, image: $image)
    }
}

struct Pull_Image_From_camera: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Open camera") {
                showImagePicker = true
            }.padding()
                .background(.green)
                .foregroundStyle(.white)
                .cornerRadius(30)
        }.sheet(isPresented: $showImagePicker, content: {
            PhotoCaptureView(showingSheet: $showImagePicker, image: $image)
        })
    }
}

#Preview {
    Pull_Image_From_camera()
}
