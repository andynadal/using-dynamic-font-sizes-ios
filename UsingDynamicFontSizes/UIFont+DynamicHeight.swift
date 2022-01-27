//
//  UIFont+DynamicHeight.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

public extension UIFont {
    /// Get a `UIFont`, dynamic custom font, preset with the designer's chosen fonts.
    /// - Parameters:
    ///   - customFont: An enum case of the available fonts.
    ///   - weight: The desired weight of the font.
    ///   - relativeSize: The float value of the original design.
    ///   - textStyle: The reference to how the font should expand, note that it's not linear.
    /// - Returns: An optional `UIFont`, could fail if font's resources are not available.
    static func dynamicFont(named: String, relativeSize: CGFloat, dynamicTextStyle textStyle: UIFont.TextStyle = .body) -> UIFont? {
        guard let font = UIFont(name: named, size: relativeSize) else { return nil }
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    /// Get a `UIFont` preset with the designer's chosen fonts, PLEASE USE `dynamicFont` FOR MOST CASES, use an explicit static font size is required.
    /// - Parameters:
    ///   - customFont: An enum case of the available fonts.
    ///   - weight: The desired weight of the font.
    ///   - size: The floating point size of the font.
    /// - Returns: An optional `UIFont`, could fail if font's resources are not available.
    static func customFont(named: String, size: CGFloat) -> UIFont? {
        guard let font = UIFont(name: named, size: size) else { return nil }
        return font
    }
}
