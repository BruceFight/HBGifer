//
//  HBImageManger.swift
//  HBGifer
//
//  Created by jianghongbao on 2017/11/22.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import CoreML

class HBImageManger: NSObject {
    static let instance = HBImageManger()
    
    func getMixImage() -> UIImage {
        var result = UIImage()
        
        if let image1 = UIImage.init(named: "appear_sleep@3x.gif") ,let image2 = UIImage.init(named: "sleep@3x.gif") {
            if let cgimage1 = image1.cgImage ,let cgimage2 = image2.cgImage {
                let totalWidth = CGFloat(cgimage1.width + cgimage2.width) / image1.scale
                let totalHeight = CGFloat(cgimage1.height + cgimage2.height) / image1.scale
                UIGraphicsBeginImageContext(CGSize.init(width: totalWidth, height: totalHeight))
                image1.draw(at: CGPoint.init(x: 0, y: 0))
                image2.draw(at: CGPoint.init(x: CGFloat(cgimage1.width) / image1.scale, y: CGFloat(cgimage1.height) / image1.scale))
            }
        }
        if let resultImage = UIGraphicsGetImageFromCurrentImageContext() {
            result = resultImage
        }

        UIGraphicsEndImageContext()
        return result
    }
}


func loadFile(fileName: String?) -> Data? {
    guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {return nil}
    let fileData = NSData.init(contentsOfFile: path)
    return fileData as Data?
}
