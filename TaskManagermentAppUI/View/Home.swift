//
//  Home.swift
//  TaskManagermentAppUI
//
//  Created by MINH DUC NGUYEN on 10/06/2022.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //MARK: - Lazy Stack With Pinned Header
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                Section {
                    //MARK: - Current Week View
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(taskModel.currentWeek, id: \.self) {day in
                                VStack(spacing: 10) {
                                    //MARK: - EEE Will return day as Mon, Tue, Wed...
                                    Text(taskModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundColor(taskModel.isToday(date: day) ? .white : .gray)
                                    
                                    //MARK: - EEE Will return day as 1, 2, 3...
                                    Text(taskModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(taskModel.isToday(date: day) ? 1 : 0)
                                }
                                //MARK: - Rounded Rectangle
                                .frame(width: 45, height: 70)
                                .background {
                                    ZStack {
                                        //MARK: - Matched Geomatry Effect
                                        if taskModel.isToday(date: day) {
                                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                                .fill(Color("Orange"))
                                                .opacity(taskModel.isToday(date: day) ? 1 : 0)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                }
                                .contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                .onTapGesture {
                                    withAnimation {
                                        //MARK: - Updating Current Day
                                        taskModel.currentDay = day
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                } header: {
                    HeaderView()
                }
            }
        }
    }
    
    //MARK: - Header
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                
                Text("Today")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("Color1"))
                    .frame(width: 140, height: 60)
                    .background(Color("Color1").opacity(0.2))
                    .cornerRadius(8)
            }
            .hLeading()
            
            Button {
                
            } label: {
                Image("Profile")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//MARK: - UI Design Helper functions
extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
