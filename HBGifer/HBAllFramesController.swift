//
//  HBAllFramesController.swift
//  HBGifer
//
//  Created by jianghongbao on 2017/11/22.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class HBAllFramesController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {

    public var gifName : String = ""
    fileprivate var tableview = UITableView()
    fileprivate var frames = [CGImage]()
    fileprivate var properties = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        analysisImageSource()
        setTablview()
    }

    func setTablview() -> () {
        tableview.frame = view.bounds
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        view.addSubview(tableview)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func analysisImageSource() -> () {
        if let data = loadFile(fileName: gifName) {
            //CGImageSourceCreateWithURL(<#T##url: CFURL##CFURL#>, <#T##options: CFDictionary?##CFDictionary?#>)
            if let imageSource = CGImageSourceCreateWithData(data as CFData, nil) {
                let framesCount = CGImageSourceGetCount(imageSource)
                //CGImageSourceCopyProperties(imageSource, nil)
                for i in 0 ..< framesCount {
                    if let currentFrame = CGImageSourceCreateImageAtIndex(imageSource, i, nil) {
                        frames.append(currentFrame)
                    }
                    
                    //CGImageSourceCopyProperties(imageSource, nil)
                    if let property = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) as? [String:Any] {
                        properties.append(property)
                    }
                }
            }
        }
    }

}

extension HBAllFramesController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? GifCell
        if cell==nil {
            cell = GifCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.tag = indexPath.row
        let curFrame = UIImage.init(cgImage: frames[indexPath.row])
        cell?.frameParams = (curFrame,properties[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
