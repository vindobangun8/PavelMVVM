//
//  ActivityView.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//

import Foundation
import SwiftUI

struct ActivityScreen : View {
    //    @StateObject
    
    @EnvironmentObject var tripVM:TripViewModel
    @Binding var path: [Screen]
    @State var showAlert : Bool = false
    @State var activityList:[Activity] = []
    
    var body: some View{
        ZStack{
            Color(UIColor.pavel.gray)
                .ignoresSafeArea()
            VStack(alignment: .leading,spacing: 5){
                Group{
                    Text("Select")
                    Text("Activities")
                }
                .bold()
                .font(.system(size: 40))
                Text("* YOU CAN SELECT MORE THAN ONE")
                Spacer()
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 170))], spacing: 15) {
                        ForEach(activityList, id: \.self) { activity in
                            ActivityGrid(activity:activity)
                        }
                    }
                }
                Button{
                    if tripVM.TransportationList.isEmpty {
                        showAlert = true
                    } else {
                        tripVM.addTrip()
//                        trip = Trip()
                        path.append(Screen.HomeScreen)
                    }
                    
                }label: {
                    Text("Generate Trip")
                }
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,maxHeight: 50)
                .background(tripVM.TransportationList.isEmpty ? Color(UIColor.systemGray3):Color(UIColor.pavel.red))
                .cornerRadius(8)
                .alert(isPresented:$showAlert) {
                    Alert(title: Text("Incomplete Information"), message: Text("Please select one"), dismissButton: .default(Text("Got it!")))
                }
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            .padding(.horizontal,16)
        }.onAppear(){
            if tripVM.ActivityListSuggestion.isEmpty{
                activityList = Activity.content
            }else{
                
                for item in tripVM.ActivityListSuggestion{
                    let activity = Activity.content.first(where:{$0.title == item})
                    activityList.append(activity!)
                }
            }
        }
        
    }
}

struct ActivityGrid : View{
    
    @EnvironmentObject var tripVM: TripViewModel
    var activity:Activity
    
    var body: some View{
        Button {
            if tripVM.isActivityExist(activity: activity) {
                tripVM.removeActivity(activity:  activity)
            } else {
                tripVM.addNewActivity(activity: activity)
            }
        } label:{
            ZStack{
                
                Text(activity.image)
                    .grayscale(tripVM.isActivityExist(activity: activity) ?0:1)
                    .font(.system(size: 60, design: .rounded))
                .frame(maxWidth:.infinity , maxHeight:.infinity ,alignment: .topLeading)
                .padding(.horizontal,10)
                
                Image(systemName: tripVM.isActivityExist(activity: activity) ?"checkmark.square.fill":"square")
                    .grayscale(tripVM.isActivityExist(activity: activity) ?0:1)
                    .foregroundColor( tripVM.isActivityExist(activity: activity) ? .white:Color(UIColor.pavel.red))
                    .font(.system(size: 30, design: .rounded))
                .frame(maxWidth:.infinity , maxHeight:.infinity ,alignment: .topTrailing)
                .padding(.all,20)
                
                Text(activity.title)
                    .foregroundColor(tripVM.isActivityExist(activity: activity) ? .white : .black)
                    .font(.system(size: 24, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth:.infinity , maxHeight:.infinity ,alignment: .bottomTrailing)
                    .padding(.all,20)
                }
            .frame(width: 170, height: 160, alignment: .topLeading)
            .background( tripVM.isActivityExist(activity: activity) ? Color(UIColor.pavel.red):.white)
                .cornerRadius(12)
                
                
                
                
            }
    }
}

//struct Activity_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityScreen(path: .constant([Screen.ActivityScreen]))
//            .environmentObject(Trip())
//    }
//}

