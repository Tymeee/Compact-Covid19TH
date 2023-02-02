//
//  DashboardStyle.swift
//  Covid19App
//
//  Created by E2318556 on 9/1/2565 BE.
//

import Foundation
import SwiftUI

extension Text {
    
    func TotalStatStyle() -> some View {
        self
            .font(.system(size: 28))
            .fontWeight(.semibold)
            .animation(Animation.default)
    }
    
    func DailyStatStyle() -> some View {
        self
            .font(.footnote)
            .fontWeight(.semibold)
            .animation(Animation.default)
    }
    
}

//Disable list scrolling
extension View {
    
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}
