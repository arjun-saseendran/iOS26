//
//  DoubleExtension.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//

import Foundation

extension Double {
    func formatCurrency()-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? "$0"

    }

}
