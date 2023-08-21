//
//  UpcomingTripView.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 21/08/23.
//

import Foundation
import SwiftUI
import CoreData

struct UpcomingTripView: View {
  
  // MARK: CoreData
    @EnvironmentObject var tripVM:TripViewModel
//  @Environment(\.managedObjectContext) private var viewContext
//  @FetchRequest(entity: TripPlans.entity(), sortDescriptors: [NSSortDescriptor(key: #keyPath(TripPlans.dateStart), ascending: false)], predicate: NSPredicate(format: "(dateEnd >= %@) AND (dateStart <= %@)", NSDate(), NSDate())
//  )
//  private var ongoingTrip: FetchedResults<TripPlans>
//
//  @FetchRequest(entity: TripPlans.entity(), sortDescriptors: [NSSortDescriptor(key: #keyPath(TripPlans.dateStart), ascending: false)], predicate: NSPredicate(format: "dateStart > %@", NSDate())
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
        
          if tripVM.ongoingTrip != nil {
          HStack {
            Text("On Going")
              .font(.system(size: 24))
              .fontWeight(.bold)
            Spacer()
          }
          .padding(.horizontal, 16)
          VStack {
              UpcomingTripCard(trip: tripVM.ongoingTrip!)
          }
          .padding(.horizontal)
        }
        HStack {
          Text("Upcoming Trip")
            .font(.system(size: 24))
            .fontWeight(.bold)
          Spacer()
          Text("See All")
            .font(.callout)
            .foregroundColor(Color(UIColor.pavel.red))
        }
        .padding(.top)
        .padding(.horizontal)
        ScrollView {
            if tripVM.listTripPlans.isEmpty {
            Text("No data")
          } else {
            LazyVStack(spacing: 10) {
                ForEach(tripVM.listTripPlans) { trip in
                UpcomingTripCard(trip: trip)
              }
            }
            .padding(.horizontal)
          }
          
        }
      }
    }
    .background(Color(UIColor.pavel.background))
    .onAppear(){
        tripVM.getListTrip()
        tripVM.getOngoingTrip()
    }
  }
}
