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
    
    func getCoincideImage(images:[UIImage]) -> UIImage {
        var result = UIImage()
        for image in images {
            if let cgImage = image.cgImage {
                UIGraphicsBeginImageContext(CGSize.init(width: CGFloat(cgImage.width), height: CGFloat(cgImage.height)))
                image.draw(at: CGPoint.zero)
            }
        }
        if let resultImage = UIGraphicsGetImageFromCurrentImageContext() {
            result = resultImage
        }
        
        UIGraphicsEndImageContext()
        return result
    }
    
    func loadFile(fileName: String?) -> Data? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {return nil}
        let fileData = NSData.init(contentsOfFile: path)
        return fileData as Data?
    }
    
    func addImage() -> UIImage {
        if let image1 = UIImage.init(named: "bg2"),
            let image2 = UIImage.init(named: "bg1") {
            UIGraphicsBeginImageContext(image1.size)
            image1.draw(in: CGRect.init(x: 0, y: 0, width: image1.size.width, height: image1.size.height))
            image2.draw(in: CGRect.init(x: 0, y: (image1.size.height - image2.size.height), width: image2.size.width, height: image2.size.height))
        }
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result ?? UIImage()
    }
}
