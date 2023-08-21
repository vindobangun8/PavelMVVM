//
//  Transportation.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//

import Foundation
struct Transportation: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String
    var image: String
}

extension Transportation {
  static var content: [Transportation] {
    [
        Transportation(title: "Train", image: "🚅"),
        Transportation(title: "Airplane", image: "✈️"),
        Transportation(title: "Car", image: "🚙"),
        Transportation(title: "Ship", image: "🛳️"),
        Transportation(title: "Motorcycle", image: "🏍️"),
        Transportation(title: "Bus", image: "🚌")
    ]
  }
}
