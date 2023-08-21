//
//  PastTripView.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 21/08/23.
//

import Foundation
import SwiftUI
import CoreData

struct PastTripView: View {
  
  // MARK: CoreData
    @EnvironmentObject var tripVM:TripViewModel
//  @Environment(\.managedObjectContext) private var viewContext
//  @FetchRequest(entity: TripPlans.entity(), sortDescriptors: [NSSortDescriptor(key: #keyPath(TripPlans.dateStart), ascending: false)], predicate: NSPredicate(format: "dateStart < %@", NSDate())
//  )
//  private var tripPlans: FetchedResults<TripPlans>
  
  // MARK: View
  var body: some View {
    VStack {
      VStack {
        VStack(alignment: .leading) {
          Image("pavel-stripe-light")
            .resizable()
            .scaledToFit()
            .frame(width: 80)
            .padding(.horizontal, 20)
          Image("clouds-fit")
            .resizable()
            .scaledToFit()
        }
        .background(
          Color(UIColor.pavel.red)
        )
        HStack {
          Text("Past Trip")
            .font(.system(size: 24))
            .fontWeight(.bold)
          Spacer()
          Text("See All")
            .font(.callout)
            .foregroundColor(Color(UIColor.pavel.red))
        }
        .padding(.horizontal, 16)
        ScrollView {
          LazyVStack(spacing: 10) {
              ForEach(tripVM.lastTripPlans) { trip in
              PastTripCard(trip: trip)
            }
          }
          .padding(.horizontal)
        }
        .navigationTitle("Cities")
      }
    }
    .background(Color(UIColor.pavel.background))
  }
}

struct PastTripView_Previews: PreviewProvider {
  static var previews: some View {
    PastTripView()
  }
}
