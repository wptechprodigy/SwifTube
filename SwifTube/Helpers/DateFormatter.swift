//
//  DateFoermatter.swift
//  SwifTube
//
//  Created by waheedCodes on 08/01/2022.
//

import Foundation

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = Constants.dateFormatText
    return dateFormatter.string(from: date)
}
