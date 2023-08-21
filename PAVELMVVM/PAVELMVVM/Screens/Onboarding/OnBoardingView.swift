//
//  Onboarding.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 21/08/23.
//

import Foundation
import SwiftUI

struct OnBoardingView: View {
  
  // MARK: UserDefaults
  @AppStorage("onboarding") var isOnboardingViewActivate: Bool = true
  
  // MARK: Properties
  @Binding var path: [Screen]
  @State var selection = 0
  @State private var imageOffset: CGSize = .zero
  @State var content = OnBoardingUtil.getOnBoarding()
  
  // MARK: View
  var body: some View {
      print("Draw OnBoardingScreen body")
    return GeometryReader { geo in
      ZStack {
        TabView(selection: $selection) {
          ForEach(content.indices, id: \.self) { i in
            OnBoardingContent(contentModel: content[i])
              .tag(content[i])
          }
        }
        .onChange(of: selection, perform: { newValue in
          print("Selected index is: \(newValue)")
        })
        .background(Color(content[selection].background))
        .tabViewStyle(.page(indexDisplayMode: .never))
      }
      
      VStack {
        Spacer()
        Image("clouds")
          .resizable()
          .scaledToFit()
      }
    }
    .navigationBarBackButtonHidden()
    .navigationBarItems(trailing: Button(action: {
      isOnboardingViewActivate = false
    }, label: {
      Text("SKIP")
        .foregroundColor(Color.white)
    }))
    .edgesIgnoringSafeArea(.all)
  }
  
}

struct OnBoardingContent: View {
  
  // MARK: Properties
  let contentModel: OnBoarding
  @State private var isAnimating: Bool = false
  
  // MARK: View
  var body: some View {
    VStack {
      ZStack {
        CircleGroup(shapeColor: .white, shapeOpacity: 0.2)
          .padding(.vertical, 50)
        Image(contentModel.image)
          .resizable()
          .scaledToFit()
          .frame(height: 350)
          .padding()
          .offset(y: isAnimating ? 15 : -15)
          .animation(
            Animation
              .easeInOut(duration: 1)
              .repeatForever(),
            value: isAnimating
          )
      }
      Text(contentModel.title)
        .foregroundColor(.white)
        .font(.system(size: 24, weight: .bold))
      Text(contentModel.desc)
        .foregroundColor(.white)
        .font(.system(size: 18))
        .padding(.top, -5)
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        isAnimating = true
      }
    }
    .padding(.all)
    .multilineTextAlignment(.center)
    .edgesIgnoringSafeArea(.all)
  }
}
