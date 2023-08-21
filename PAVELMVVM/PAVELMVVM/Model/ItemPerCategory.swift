//
//  ItemPerCategory.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//

import Foundation
import SwiftUI

struct itemPerCategory: Identifiable, Hashable {
    var id = UUID()
    var category: String
    var itemName: String
    var isAbroad: Bool = false
    var image: String = ""
}

extension itemPerCategory {
  static var content: [itemPerCategory] {
    [
        itemPerCategory(category: "Essential", itemName: "Item List"),
        itemPerCategory(category: "Essential", itemName: "Cell Phone Charger"),
        itemPerCategory(category: "Essential", itemName: "Umbrella"),
        itemPerCategory(category: "Essential", itemName: "Medication"),
        itemPerCategory(category: "Essential", itemName: "Wallet"),
        itemPerCategory(category: "Essential", itemName: "Smartphone"),
        itemPerCategory(category: "Essential", itemName: "Passport", isAbroad: true),
        itemPerCategory(category: "Essential", itemName: "Bottle"),
        itemPerCategory(category: "Essential", itemName: "International Adapter", isAbroad: true),
        itemPerCategory(category: "Camping", itemName: "Tent"),
        itemPerCategory(category: "Camping", itemName: "Flashlight"),
        itemPerCategory(category: "Camping", itemName: "Sleeping Bag"),
        itemPerCategory(category: "Camping", itemName: "Cooking tools"),
        itemPerCategory(category: "Camping", itemName: "First Aid Kit"),
        itemPerCategory(category: "Personal Care", itemName: "Shampoo"),
        itemPerCategory(category: "Personal Care", itemName: "Soap"),
        itemPerCategory(category: "Personal Care", itemName: "Deodorant"),
        itemPerCategory(category: "Personal Care", itemName: "Toothbrush"),
        itemPerCategory(category: "Personal Care", itemName: "Toothpaste"),
        itemPerCategory(category: "Personal Care", itemName: "Sunscreen"),
        itemPerCategory(category: "Personal Care", itemName: "Face wash"),
        itemPerCategory(category: "Beach", itemName: "Beach Swimsuit"),
        itemPerCategory(category: "Beach", itemName: "Sunglasess"),
        itemPerCategory(category: "Beach", itemName: "Hat"),
        itemPerCategory(category: "Beach", itemName: "Sandals"),
        itemPerCategory(category: "Beach", itemName: "Beach Towels"),
        itemPerCategory(category: "Surfing", itemName: "Surfboard"),
        itemPerCategory(category: "Surfing", itemName: "Leash"),
        itemPerCategory(category: "Surfing", itemName: "Surf wax"),
        itemPerCategory(category: "Surfing", itemName: "Wetsuit"),
        itemPerCategory(category: "Photography", itemName: "Batteries"),
        itemPerCategory(category: "Photography", itemName: "Battery Charger"),
        itemPerCategory(category: "Photography", itemName: "Camera bag"),
        itemPerCategory(category: "Photography", itemName: "Camera Charger"),
        itemPerCategory(category: "Photography", itemName: "Lenses"),
        itemPerCategory(category: "Photography", itemName: "Camera"),
        itemPerCategory(category: "Photography", itemName: "Tripod"),
        itemPerCategory(category: "Cruising", itemName: "Swimsuit"),
        itemPerCategory(category: "Cruising", itemName: "Formal Clothes"),
        itemPerCategory(category: "Cruising", itemName: "Sunglasess"),
        itemPerCategory(category: "Cruising", itemName: "Camera"),
        itemPerCategory(category: "Cruising", itemName: "Chalk bag and climbing chalk"),
        itemPerCategory(category: "Climbing", itemName: "Helmet"),
        itemPerCategory(category: "Climbing", itemName: "Locking Carabiner"),
        itemPerCategory(category: "Climbing", itemName: "Climbing Harness"),
        itemPerCategory(category: "Climbing", itemName: "Belay Device"),
        itemPerCategory(category: "Climbing", itemName: "Climbing Shoes"),
        itemPerCategory(category: "Climbing", itemName: "Climbing ropes"),
        itemPerCategory(category: "Climbing", itemName: "Slings"),
        itemPerCategory(category: "Climbing", itemName: "Quickdraws"),
        itemPerCategory(category: "Skiing", itemName: "Ski/Snowboard"),
        itemPerCategory(category: "Skiing", itemName: "Ski/Snowboard boots"),
        itemPerCategory(category: "Skiing", itemName: "Poles"),
        itemPerCategory(category: "Skiing", itemName: "Helmet"),
        itemPerCategory(category: "Skiing", itemName: "Gloves"),
        itemPerCategory(category: "Skiing", itemName: "Goggles"),
        itemPerCategory(category: "Skiing", itemName: "Warm hat/beanie"),
        itemPerCategory(category: "Skiing", itemName: "Ski socks"),
        itemPerCategory(category: "Skiing", itemName: "Lip Balm"),
        itemPerCategory(category: "Kayaking", itemName: "WetSuit/DrySuit"),
        itemPerCategory(category: "Kayaking", itemName: "Kayak"),
        itemPerCategory(category: "Kayaking", itemName: "Kayaking Shoes"),
        itemPerCategory(category: "Kayaking", itemName: "Helmet"),
        itemPerCategory(category: "Kayaking", itemName: "Helmet"),
        itemPerCategory(category: "Party", itemName: "Party Outfit"),
        itemPerCategory(category: "Diving", itemName: "Wetsuit"),
        itemPerCategory(category: "Diving", itemName: "Snorkel"),
        itemPerCategory(category: "Diving", itemName: "Mask"),
        itemPerCategory(category: "Diving", itemName: "Buoyancy Control Device(BCD)"),
        itemPerCategory(category: "Airplane", itemName: "Boarding pass"),
        itemPerCategory(category: "Airplane", itemName: "Book"),
        itemPerCategory(category: "Airplane", itemName: "Eye mask"),
        itemPerCategory(category: "Airplane", itemName: "Travel pillow"),
        itemPerCategory(category: "Train", itemName: "Ticket"),
        itemPerCategory(category: "Train", itemName: "Book"),
        itemPerCategory(category: "Train", itemName: "Travel pillow"),
        itemPerCategory(category: "Train", itemName: "Eye mask"),
        itemPerCategory(category: "Car", itemName: "Drivel license"),
        itemPerCategory(category: "Car", itemName: "Sunglasses"),
        itemPerCategory(category: "Ship", itemName: "Motion sickness pill"),
        itemPerCategory(category: "Ship", itemName: "Ticket"),
        itemPerCategory(category: "Motorcycle", itemName: "Helmet"),
        itemPerCategory(category: "Motorcycle", itemName: "Jacket"),
        itemPerCategory(category: "Motorcycle", itemName: "Sunglasses"),
        itemPerCategory(category: "Motorcycle", itemName: "Mask"),
        itemPerCategory(category: "Motorcycle", itemName: "Gloves"),
        itemPerCategory(category: "Clothes", itemName: "Shirts"),
        itemPerCategory(category: "Clothes", itemName: "Pants"),
        itemPerCategory(category: "Clothes", itemName: "Undies"),
        itemPerCategory(category: "Clothes", itemName: "Socks"),
        itemPerCategory(category: "Running", itemName: "Running shoes"),
        itemPerCategory(category: "Running", itemName: "Bottle"),
        itemPerCategory(category: "Sailing", itemName: "Travel bag"),
        itemPerCategory(category: "Sailing", itemName: "Sunscreen"),
        itemPerCategory(category: "Cycling", itemName: "Bottle"),
        itemPerCategory(category: "Cycling", itemName: "Bike"),
        itemPerCategory(category: "Cycling", itemName: "Helmet"),
    ]
  }
}
