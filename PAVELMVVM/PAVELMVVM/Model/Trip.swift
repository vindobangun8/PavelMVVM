//
//  Trip.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//

import Foundation
struct Trip: Identifiable, Hashable {
  var id = UUID()
  var title: String
  var date: String
  var duration: Int
  var origin: String
  var destination: String
  var type: String
}
