//
//  CourseCardView.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//

import SwiftUI

struct CourseCardView: View {
    var course: Course
    var body: some View {

        VStack(alignment: .leading){
            Text(course.title)
                .bold()
                .font(.title2)
            Text(course.desc)
//                .fixedSize(horizontal: false, vertical: true)
            HStack{
                Circle()
                    .frame(width: 10, height: 10)
                Text(course.duration)
                Circle()
                    .frame(width: 10, height: 10)
                Text(course.category.rawValue)
                Circle()
                    .frame(width: 10, height: 10)
                Text(course.publishedDate.formatted(date: .abbreviated, time: .omitted))
                Spacer()

            }
            .padding(.top, 10)
            .foregroundStyle(.secondary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(.gray))
    }
}

#Preview {
    CourseCardView(course: Course.sampleData[0])
}
