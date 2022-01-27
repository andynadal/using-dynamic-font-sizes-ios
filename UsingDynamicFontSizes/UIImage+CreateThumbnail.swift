//
//  UIImage+CreateThumbnail.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import UIKit

extension UIImage {
    static func createThumbnail(from data: Data, desiredHeight height: CGFloat, _ callback: @escaping (UIImage?) -> Void) {
        let cfData = data as CFData
        DispatchQueue.global(qos: .userInteractive).async {
            let options = [
                kCGImageSourceCreateThumbnailWithTransform: true,
                kCGImageSourceCreateThumbnailFromImageAlways: true,
                kCGImageSourceThumbnailMaxPixelSize: height
            ] as CFDictionary
            
            guard let source = CGImageSourceCreateWithData(cfData, nil),
                  let cgImageReference = CGImageSourceCreateThumbnailAtIndex(source, 0, options)
            else {
                callback(nil)
                return
            }
            
            let thumbnail = UIImage(cgImage: cgImageReference)
            callback(thumbnail)
        }
    }
}
