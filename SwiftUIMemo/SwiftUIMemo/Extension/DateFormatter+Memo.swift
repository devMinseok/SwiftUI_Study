//
//  DateFormatter+Memo.swift
//  SwiftUIMemo
//
//  Created by 강민석 on 2020/05/10.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let memoDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeZone = .none
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
}

extension DateFormatter: ObservableObject {
    
}
