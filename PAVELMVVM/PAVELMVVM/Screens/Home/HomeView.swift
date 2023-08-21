//
//  HomeView.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 21/08/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    // MARK: UserDefaults
    @AppStorage("onboarding") var isOnboardingViewActivate: Bool = true
    
    // MARK: PersistenceController
    let persistenceController = PersistenceController.shared
    
    // MARK: Properties
    @Binding var path: [Screen]
    @StateObject var trip  = TripViewModel()
    
    // MARK: View
    var body: some View {
        print("Draw HomeScreen body")
        return NavigationStack(path: $path) {
            SplashScreen(path: $path)
                .environmentObject(trip)
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .OnBoardingScreen:
                        OnBoardingView(path: $path)
                    case .CreateScreen:
                        CreateTripView(path: $path)
                    case .TransportationScreen:
                        TransportationView(path: $path)
                    case .ActivityScreen:
                        ActivityScreen(path: $path)
                    case .DashboardScreen:
                      DashboardView(path: $path)
                    case .ImagePreviewScreen(let image, let imageHasBeenChosen):
                        ImagePreviewView(path: $path, imageHasBeenChosen: imageHasBeenChosen, image: image)
                    default:
                        ZStack {
                            if isOnboardingViewActivate {
                                OnBoardingView(path: $path)
                            } else {
                                DashboardView(path:$path)
//                                ListScreen(path: $path)
                            }
                        }
//                        DocumentList(path: $path)
//                        TripScoreScreen()
                    }
                }
        }
        .environmentObject(trip)
        
    }
}
