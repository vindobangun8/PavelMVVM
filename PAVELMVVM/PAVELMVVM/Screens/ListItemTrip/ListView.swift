//
//  ListView.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 21/08/23.
//

import Foundation
import SwiftUI

struct ListView: View {
  @State private var favoriteColor = 0
  @State private var isResult = true
  @Binding var path: [Screen]
  @State var newDocumentTitle = ""
  @State var buttonColor = Color(UIColor.pavel.red)
  
  var body: some View {
    ZStack {
      Color(UIColor.pavel.gray)
        .ignoresSafeArea()
      VStack (alignment: .leading) {
        VStack (alignment: .leading, spacing: 12) {
          HStack {
            Text("Trip to Singapore")
              .font(.largeTitle)
              .fontWeight(.bold)
              .foregroundColor(.black)
            Spacer()
          }
          HStack (spacing: 12) {
            Text("Tanggal")
            //              .font(.footnote)
              .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
              .foregroundColor(.white)
              .background(Color(UIColor.pavel.red))
              .cornerRadius(5)
            Text("4 days")
            //              .font(.footnote)
              .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
              .foregroundColor(.white)
              .background(Color(UIColor.pavel.red))
              .cornerRadius(5)
            //                        Spacer()
          }
        }
        .padding()
        //        .frame(maxWidth: .infinity)
        .background(.white)
//        .cornerRadius(12)
        VStack (alignment: .leading) {
          
//          Spacer()
//            .frame(height: 12)
          Picker("Menu?", selection: $favoriteColor) {
            Text("Items").tag(0)
            Text("Documents").tag(1)
          }.pickerStyle(.segmented)
          Spacer()
            .frame(height: 24)
          Text("Item List")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.black)
          Text("Here are the documents you need to bring for every activity you will do during this trip.")
            .foregroundColor(.black)
          Spacer()
            .frame(height: 24)
          
          VStack {
            DisclosureGroup {
    //          VStack {
    //            if isResult {
    //              ScrollView(.horizontal) {
    //                HStack {
    //                  ForEach(1..<2) { item in
    //                    ItemDocumentResult()
    //                      .padding(4)
    //                      .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
    //                  }
    //                }
    //              }
    //            } else {
    //              ForEach(1..<4) { item in
    //                ItemDocument(item: item)
    //                  .padding(.bottom, item != 4 ? 16 : 0)
    //              }
    //
    //              HStack {
    //                Image(systemName: "plus")
    //                  .foregroundColor(Color(UIColor.pavel.red))
    //                TextField("Add document title", text: $newDocumentTitle)
    //                Spacer()
    //
    //                Button {
    ////                  self.showActionSheet = true
    //                } label: {
    //                  HStack(spacing: 4) {
    //
    //                  }
    //                  .padding(.vertical, 4)
    //                  .padding(.horizontal, 8)
    //                  .background(
    //                    RoundedRectangle(cornerRadius: 4)
    //                      .foregroundColor(Color(UIColor.systemGray6))
    //                  )
    //                  .font(.caption)
    //                  .foregroundColor(Color(UIColor.pavel.red))
    //                }
    //              }
    //
    //            }
    //          }
    //          .padding(.vertical, 16)
    //          .padding(.horizontal, 4)
            } label: {
              Text("⚙️  Essentials")
                .foregroundColor(Color.black)
                .font(.title2)
                .fontWeight(.bold)
            }
            DisclosureGroup {
              HStack {
                Spacer()
                  .frame(width: 36)
                Button {
                  
                } label: {
                  Image(systemName: "checkmark.square")
                    .foregroundColor(buttonColor)
                }
                .onTapGesture {
                  buttonColor = Color.gray
                }

                Spacer()
                  .frame(width: 12)
                Text("Camera")
                Spacer()
                Image(systemName: "plus")
                  .foregroundColor(Color(UIColor.pavel.red))

              }
              .padding(.vertical, 8)
            } label: {
              Text("👕  Clothes")
                .foregroundColor(Color.black)
                .font(.title2)
                .fontWeight(.bold)
            }
            
            
            
          }
          
        }
        .padding()
        
        Spacer()
        
      }
//      .padding(24)
      
      //            .ignoresSafeArea()
    }
  }
}

//struct ListScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ListScreen()
//    }
//}
