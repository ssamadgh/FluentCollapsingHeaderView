//
//  UIImage+Extensions.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 10/1/21.
//

import UIKit

extension UIImage {
    
    class func imageFromColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}


