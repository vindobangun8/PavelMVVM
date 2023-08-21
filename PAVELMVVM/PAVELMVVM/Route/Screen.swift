//
//  Screen.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//

import Foundation
import SwiftUI

enum Screen: Hashable, Equatable {
    case SplashScreen
    case HomeScreen
    case OnBoardingScreen
    case CreateScreen
    case TransportationScreen
    case ActivityScreen
    case DashboardScreen
    case ResultScreen
    case ImagePreviewScreen(Image, Binding<Bool>)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    //Create a custom implementation of Equatable that ignores Binding
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
