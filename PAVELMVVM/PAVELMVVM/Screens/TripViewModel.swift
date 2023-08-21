//
//  TripViewModel.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//

import Foundation
import CoreData

class TripViewModel: ObservableObject {
    // MARK: properties
    @Published var title: String = ""
    @Published var destination: String = ""
    @Published var dateStart: String = ""
    @Published var dateEnd: String = ""
    @Published var duration: Int = 0
    @Published var origin: String = ""
    @Published var isWinter: Bool = false
    @Published var isAbroad:Bool = false
    @Published var TransportationList: [Transportation] = []
    @Published var ActivityList: [Activity] = []
    @Published var ActivityListSuggestion: [String] = []
    @Published var listTripPlans:[TripPlans] = []
    @Published var ongoingTrip:TripPlans?
    @Published var lastTripPlans:[TripPlans] = []
    
    private let viewContext = PersistenceController.shared.managedObjectContext
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMMM d, y"
        return df
    }()
    
    func clearVariable(){
        title = ""
        destination = ""
        dateStart = ""
        dateEnd = ""
        duration = 0
        origin = ""
        isWinter = false
        isAbroad = false
        TransportationList = []
        ActivityList = []
        ActivityListSuggestion = []
        
    }
    func isTransportationExist(transportation: Transportation) -> Bool {
//        print("sini 2")
//        print(transportation)
        if let _ = TransportationList.first(where: { $0.title == transportation.title }) {
            return true
        }
        return false
    }
    
    func addNewTransportation (transportation:Transportation){
        TransportationList.append(transportation)
    }
    
    func removeTransportation (transportation:Transportation){
        TransportationList.removeAll(where: { $0.title == transportation.title })
        
    }
    
    func isActivityExist(activity: Activity) -> Bool {
        if let _ = ActivityList.first(where: { $0.title == activity.title }) {
            return true
        }
        return false
    }
    
    func addNewActivity (activity:Activity){
        ActivityList.append(activity)
    }
    
    func removeActivity (activity:Activity){
        ActivityList.removeAll(where: { $0.title == activity.title })
        
    }
    
    func getListTrip() {
        let request:NSFetchRequest<TripPlans> = TripPlans.fetchRequest()
        request.predicate =  NSPredicate(format: "dateStart > %@", NSDate())
        var list:[TripPlans] = []
        
        do {
            let trips = try viewContext.fetch(request)
            
            for trip in trips {
                list.append(trip)
            }
            
            listTripPlans = trips
        } catch {
            print("Failed getting user details")
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func getOngoingTrip() {
        let request:NSFetchRequest<TripPlans> = TripPlans.fetchRequest()
        request.predicate =  NSPredicate(format: "(dateEnd >= %@) AND (dateStart <= %@)", NSDate(), NSDate())
        do {
            let trips = try viewContext.fetch(request)
//            if !trips.isEmpty{
//                ongoingTrip =  trips.first
//            }
            ongoingTrip = trips.first != nil ? trips.first : nil
            
        } catch {
            print("Failed getting user details")
            print("Error: \(error.localizedDescription)")
         
            
        }
    }
    
    func getLastTrip(){
        let request:NSFetchRequest<TripPlans> = TripPlans.fetchRequest()
        request.predicate =   NSPredicate(format: "dateStart < %@", NSDate())
        var list:[TripPlans] = []
        
        do {
            let trips = try viewContext.fetch(request)
            
            for trip in trips {
                list.append(trip)
            }
           lastTripPlans = list
        } catch {
            print("Failed getting user details")
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func checkTrip() -> Bool {
        
        //    viewContext.execute(NSFetchRequest<TripPlans>(entityName: "TripPlans"))
        
        var data:[TripPlans]
        let fetchRequest =  NSFetchRequest<TripPlans>(entityName: "TripPlans")
        fetchRequest.sortDescriptors = []
        fetchRequest.predicate = NSPredicate(format: "(dateStart <= %@) && (dateEnd >= %@)", dateFormatter.date(from: dateEnd)! as CVarArg , dateFormatter.date(from: dateStart)!  as  CVarArg)
        
        fetchRequest.fetchLimit = 1
        do {
            data = try viewContext.fetch(fetchRequest)
            
            if(data.isEmpty){
                return true
            }else{
                print(data.first!)
            }
        } catch {
            print("Cannot fetch Expenses")
        }
        return false
    }
    
    func addTrip(){
        let newTrip = TripPlans(context:viewContext)
        newTrip.id = UUID()
        newTrip.title = title
        newTrip.origin = origin
        newTrip.destination = destination
        newTrip.duration = Int32(duration)
        newTrip.isAbroad = isAbroad
        newTrip.dateStart = dateFormatter.date(from: dateStart)
        newTrip.dateEnd = dateFormatter.date(from: dateEnd)
        
        for category in TransportationList {
            let newCategory = Categories(context:viewContext)
            newCategory.id = UUID()
            newCategory.name = category.title
            newCategory.icon = category.image
            newCategory.isWinter = false


            let arrFilter =  itemPerCategory.content.filter{item in
                return item.category == category.title
            }

            for item in arrFilter {
                let newItem = Items(context:viewContext)
                newItem.id = UUID()
                newItem.name = item.itemName
                newItem.isCheck = false
                newItem.total = 1
                newCategory.addToItems(newItem)
                print(newItem)
            }

            newTrip.addToCategories(newCategory)
        }
        
        for category in ActivityList {
            let newCategory = Categories(context:viewContext)
            newCategory.id = UUID()
            newCategory.name = category.title
            newCategory.icon = category.image
            newCategory.isWinter = false

            let arrFilter =  itemPerCategory.content.filter{item in
                return item.category == category.title
            }

            for item in arrFilter {
                let newItem = Items(context:viewContext)
                newItem.id = UUID()
                newItem.name = item.itemName
                newItem.isCheck = false
                newItem.total = 1
                newItem.category = newCategory
                
                if item.isAbroad && isAbroad{
                    newCategory.addToItems(newItem)
                }else if !item.isAbroad{
                    newCategory.addToItems(newItem)
                }
              

            }
            newTrip.addToCategories(newCategory)
        }
        do {
            try viewContext.save()
            listTripPlans.append(newTrip)
            clearVariable()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }

}
