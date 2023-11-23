//
//  DateComponentsFormatterExtension.swift
//  KTV
//
//  Created by 최안용 on 11/23/23.
//

import Foundation

extension DateComponentsFormatter {
    
     static let playTimeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
         
         return formatter
     }()
}
