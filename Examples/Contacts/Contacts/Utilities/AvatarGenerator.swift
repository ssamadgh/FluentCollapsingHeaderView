//
//  AvatarGenerator.swift
//  Contacts
//
//  Created by Seyed Samad Gholamzadeh on 10/7/21.
//

import UIKit

struct AvatarGenerator {
    
    static func generate(withFirstName firstName: String, lastName: String) -> UIImage {
        let text: String
        if let firstChar = firstName.first, let secondChar = lastName.first {
            text = "\(firstChar)\(secondChar)"
        }
        else {
           text = ""
        }
        let contextSize = CGSize(width: 80, height: 80)
        UIGraphicsBeginImageContextWithOptions(contextSize, false, UIScreen.main.scale)
        
        let path = UIBezierPath(arcCenter: CGPoint(x: contextSize.width/2, y: contextSize.height/2), radius: contextSize.width/2, startAngle: 0, endAngle: .pi*2, clockwise: true)
        path.addClip()

        let context = UIGraphicsGetCurrentContext()!
//        context.addPath(path.cgPath)
        context.setFillColor(UIColor.gray.cgColor)
        context.fill(CGRect(origin: .zero, size: contextSize))
        let attributeKeys: [NSAttributedString.Key : Any] =
        [
            .font : UIFont(name: "ArialRoundedMTBold", size: 30)!,
            .foregroundColor: UIColor.white
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributeKeys)
        let textSize = attributedString.size()
        
        attributedString.draw(at: CGPoint(x: (contextSize.width - textSize.width)/2, y: (contextSize.height - textSize.height)/2))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        
        return image
    }
    
}
