//
//  DocumentList.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 21/08/23.
//

import Foundation
import SwiftUI

struct DocumentList: View {
    @Binding var path: [Screen]
    @State var newDocumentTitle = ""
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var image: Image?
    @State private var imageHasBeenChosen = false
    @State private var isResult = true
    
    var body: some View {
        ZStack {
            Color(UIColor.pavel.gray)
            VStack(alignment: .leading) {
                Text("Document List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor.pavel.darkGray))
                Text("Here are the documents you need to bring for every activity you will do during this trip.")
                    .foregroundColor(.gray)
                Spacer()
                    .frame(height: 24)
                VStack (alignment: .leading) {
                    DisclosureGroup {
                        VStack {
                            if isResult {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(1..<4) { item in
                                            ItemDocumentResult()
                                                .padding(4)
                                                .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                        }
                                    }
                                }
                            } else {
                                ForEach(1..<4) { item in
                                    ItemDocument(item: item)
                                        .padding(.bottom, item != 4 ? 16 : 0)
                                }
                                
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color(UIColor.pavel.red))
                                    TextField("Add document title", text: $newDocumentTitle)
                                    Spacer()
                                    
                                    Button {
                                        if imageHasBeenChosen {
                                            path.append(Screen.ImagePreviewScreen(image!, $imageHasBeenChosen))
                                        } else {
                                            self.showActionSheet = true
                                        }
                                    } label: {
                                        HStack(spacing: 4) {
                                            if !imageHasBeenChosen {
                                                Image(systemName: "square.and.arrow.up")
                                            }
                                            Text(imageHasBeenChosen ? "See File" : "Upload File")
                                            if imageHasBeenChosen {
                                                Image(systemName: "chevron.right")
                                            }
                                        }
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .foregroundColor(Color(UIColor.systemGray6))
                                        )
                                        .font(.caption)
                                        .foregroundColor(Color(UIColor.pavel.red))
                                    }
                                }
                                
                            }
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 4)
                    } label: {
                        Text("🚗  Transportation")
                            .foregroundColor(Color(UIColor.pavel.darkGray))
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 8).padding(.horizontal)
                    .background(Color.white).cornerRadius(8)
                    
                    DisclosureGroup {
                        VStack {
                            if isResult {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(1..<4) { item in
                                            ItemDocumentResult()
                                                .padding(4)
                                                .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                        }
                                    }
                                }
                            } else {
                                ForEach(1..<4) { item in
                                    ItemDocument(item: item)
                                        .padding(.bottom, item != 4 ? 16 : 0)
                                }
                                
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color(UIColor.pavel.red))
                                    TextField("Add document title", text: $newDocumentTitle)
                                    Spacer()
                                    
                                    Button {
                                        if imageHasBeenChosen {
                                            path.append(Screen.ImagePreviewScreen(image!, $imageHasBeenChosen))
                                        } else {
                                            self.showActionSheet = true
                                        }
                                    } label: {
                                        HStack(spacing: 4) {
                                            if !imageHasBeenChosen {
                                                Image(systemName: "square.and.arrow.up")
                                            }
                                            Text(imageHasBeenChosen ? "See File" : "Upload File")
                                            if imageHasBeenChosen {
                                                Image(systemName: "chevron.right")
                                            }
                                        }
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .foregroundColor(Color(UIColor.systemGray6))
                                        )
                                        .font(.caption)
                                        .foregroundColor(Color(UIColor.pavel.red))
                                    }
                                }
                                
                            }
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 4)
                    } label: {
                        Text("🏨  Hotel")
                            .foregroundColor(Color(UIColor.pavel.darkGray))
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 8).padding(.horizontal)
                    .background(Color.white).cornerRadius(8)
                    
                    DisclosureGroup {
                        VStack {
                            if isResult {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(1..<4) { item in
                                            ItemDocumentResult()
                                                .padding(4)
                                                .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                        }
                                    }
                                }
                            } else {
                                ForEach(1..<4) { item in
                                    ItemDocument(item: item)
                                        .padding(.bottom, item != 4 ? 16 : 0)
                                }
                                
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color(UIColor.pavel.red))
                                    TextField("Add document title", text: $newDocumentTitle)
                                    Spacer()
                                    
                                    Button {
                                        if imageHasBeenChosen {
                                            path.append(Screen.ImagePreviewScreen(image!, $imageHasBeenChosen))
                                        } else {
                                            self.showActionSheet = true
                                        }
                                    } label: {
                                        HStack(spacing: 4) {
                                            if !imageHasBeenChosen {
                                                Image(systemName: "square.and.arrow.up")
                                            }
                                            Text(imageHasBeenChosen ? "See File" : "Upload File")
                                            if imageHasBeenChosen {
                                                Image(systemName: "chevron.right")
                                            }
                                        }
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .foregroundColor(Color(UIColor.systemGray6))
                                        )
                                        .font(.caption)
                                        .foregroundColor(Color(UIColor.pavel.red))
                                    }
                                }
                                
                            }
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 4)
                    } label: {
                        Text("🎫  Entrance Ticket")
                            .foregroundColor(Color(UIColor.pavel.darkGray))
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 8).padding(.horizontal)
                    .background(Color.white).cornerRadius(8)
                    
                }
                //            .disclosureGroupStyle(ListScreenDisclosureGroupStyle())
//                .padding(.horizontal, 16)
            }
            .padding(.all, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Select Photo"), buttons: [
                    .default(Text("Take Photo"), action: { self.showImagePicker = true }),
                    .default(Text("Choose Photo"), action: { self.showImagePicker = true }),
                    .cancel(Text("Cancel"))
                ])
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$image, showImagePicker: self.$showImagePicker)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = image else { return }
        image = inputImage
        
        path.append(Screen.ImagePreviewScreen(image!, $imageHasBeenChosen))
        //        NavigationLink(
        //        ImagePreviewScreen(image: image!)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: Image?
    @Binding var showImagePicker: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // No update needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }
            
            parent.showImagePicker = false
        }
    }
}

struct ItemDocument: View {
    var item: Int
    var body: some View {
        HStack {
            Checkbox()
            Spacer()
            Text("Flight Ticket JKT - SIN")
            Spacer()
            Spacer()
            Button {
                
            } label: {
                HStack {
                    Text("See file")
                    Image(systemName: "chevron.forward")
                }
                .foregroundColor(Color(UIColor.pavel.red))
                .font(.caption)
            }
        }
    }
}

struct ItemDocumentResult: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear.overlay(
                Image("ticket")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            HStack {
                Text("Flight Ticket JKT - SIN")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 14))
            .foregroundColor(Color(UIColor.pavel.red))
            .padding(.all, 12)
            .background(.white)
        }
        .frame(width: 200, height: 150)
        .fixedSize()
        .cornerRadius(8)
    }
}

struct Checkbox: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 2)
                .stroke(
                    Color(UIColor.pavel.red),
                    lineWidth: 2
                )
                .frame(maxWidth: 20, maxHeight: 20)
            Image(systemName: "checkmark")
                .foregroundColor(Color(UIColor.pavel.red))
        }
    }
}

//struct DocumentList_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentList()
//    }
//}

//struct ItemDocumentResult_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDocumentResult()
//    }
//}
