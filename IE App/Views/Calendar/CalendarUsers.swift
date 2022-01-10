//
//  CalendarUser.swift
//  IE App
//
//  Created by rayane mazari on 28/12/21.
//

import SwiftUI

struct CalendarUser: View {
    @Binding var currentDate: Date
    
    // Mounth udate on arrow button clicks....
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack(spacing: 10){
            // Days...
            let days: [String] = ["Sun", "Mon","Tue","Wed","Thu","Fri","Sat"]
            HStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title2)
                        .fontWeight(.bold)
                    
                }
                Spacer(minLength: 0)
                
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                    
                }label:{
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                Button{
                    
                    withAnimation{
                        currentMonth += 1

                    }
                    
                }label:{
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
        }
            .padding(.horizontal)
            //day view...
            
            HStack(spacing: 0){
                ForEach(days, id: \.self){day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // dates.....
            // lazy grid...
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 0){
                ForEach(extractDate()){
                    value in
                    
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(SwiftUI.Color("LightBlue"))
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                    
                }
            }
            
            VStack(spacing: 15){
                
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)}){
                    
                    ForEach(task.task){
                        task in
                        VStack(alignment: .leading, spacing: 10){
                            
                            //For Custom Timing...
                            Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style:
                                        .time)
                                .font(.footnote)
                            
                            Text(task.title)
                                .font(.headline)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color.blue
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                    }
                    
                }else{
                    Text("No Task Found")
                }
                
            }
            .padding(.horizontal)
            
        }
        .onChange(of: currentMonth){
            newValue in
            // updating mounth...
            currentDate = getCurrentMonth()
            
        }
    }
    
    @ViewBuilder
    func CardView(value: CalendarUserModel)->some View{
        
        VStack{
            if value.day != -1{
                if let task = tasks.first(where: {
                    task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    VStack(spacing: 3){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white: .primary)
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white: SwiftUI.Color("LightBlue"))
                        .frame(width: 7, height:7)
                    
                    }.frame(maxWidth: .infinity)
                    
                }else{
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white: .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }

            }
        }
        .padding(.vertical,9)
        .frame(height: 50, alignment: .top)
    }
    
    //checking datess...
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //extracting year and month for display
    
    func  extraDate()->[String]{
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        
        let calendar = Calendar.current
        
        // Getting Current month date...
        guard let currentMounth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMounth
    }
    
    
    
    func extractDate()->[CalendarUserModel]{
        
        let calendar = Calendar.current
        
        // Getting Current month date...
        let currentMounth = getCurrentMonth()
        
        
        var days = currentMounth.getAllDates().compactMap{ date
            -> CalendarUserModel in

            //getting dates
            let day = calendar.component(.day, from: date)
            
            return CalendarUserModel(day: day, date: date)
        }
        
        //adding offset days to get exact week days...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(CalendarUserModel(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
}

struct CalendarUser_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHome()
    }
}


//extanding date to get current month dates....

extension Date{
    func getAllDates()->[Date]{
        let calendar = Calendar.current
        
        // getting start date...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month],from: self))!
        
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        

        //getting date...
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value:day - 1 ,to: startDate)!
        }
    }
}
