//
//  BlurModifier.swift
//  HaBu
//
//  Created by mert alp on 7.12.2023.
//

import Foundation
import SwiftUI

struct BlurModifier: ViewModifier {
    var color : Color
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(1), radius: 2, x: 2, y:2)
            )
            .foregroundColor(Color.blue)
    }
}
