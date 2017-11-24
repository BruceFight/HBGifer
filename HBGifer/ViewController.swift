//
//  ViewController.swift
//  HBGifer
//
//  Created by jianghongbao on 2017/11/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {

    fileprivate var gifs : [String] = ["appear_sleep@3x.gif","sleep@3x.gif","sleep_noask@3x.gif"]
    fileprivate var types : [String] = ["appear_sleep","sleep","sleep_noask"]
    fileprivate var operats : [String] = ["appear_sleep","sleep","sleep_noask"]
    fileprivate var tableview = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
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


}

extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? GifCell
        if cell==nil {
            cell = GifCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.tag = indexPath.row
        cell?.params = (gifs[indexPath.row],types[indexPath.row],operats[indexPath.row])
        cell?.showFramesHandler = {[weak self] (tag) in
            guard let strongSelf = self else {
                return
            }
            let frameVc = HBAllFramesController()
            frameVc.gifName = strongSelf.gifs[tag]
            strongSelf.navigationController?.pushViewController(frameVc, animated: true)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}

class GifCell: UITableViewCell {
    fileprivate var gifImageView = FLAnimatedImageView()
    fileprivate var typeLabel = UITextView()
    fileprivate var operatBtn = UIButton()
    
    public var showFramesHandler : ((_ tag:Int) -> ())?
    fileprivate var kIfDefault : Bool = true
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(gifImageView)
        typeLabel.textColor = UIColor.gray
        typeLabel.font = UIFont.systemFont(ofSize: 13)
        typeLabel.textAlignment = .center
        contentView.addSubview(typeLabel)
        operatBtn.setTitleColor(UIColor.black, for: .normal)
        operatBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        operatBtn.titleLabel?.textAlignment = .center
        operatBtn.addTarget(self, action: #selector(getMixImage), for: .touchUpInside)
        contentView.addSubview(operatBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if kIfDefault {
            defaultLayout()
        }else {
            frameDetaillayout()
        }
    }
    
    func defaultLayout() -> () {
        gifImageView.frame = CGRect.init(x: 0, y: 0, width: bounds.height, height: bounds.height)
        typeLabel.frame = CGRect.init(x: gifImageView.frame.maxX + 10, y: 0, width: bounds.width - gifImageView.bounds.width, height: bounds.height / 2)
        operatBtn.frame = CGRect.init(x: gifImageView.frame.maxX + 10, y: typeLabel.frame.maxY, width: bounds.width - gifImageView.bounds.width, height: bounds.height / 2)
    }
    
    func frameDetaillayout() -> () {
        gifImageView.frame = CGRect.init(x: 0, y: 0, width: bounds.height, height: bounds.height)
        typeLabel.frame = CGRect.init(x: gifImageView.frame.maxX, y: 0, width: bounds.width - gifImageView.frame.maxX, height: bounds.height)
        operatBtn.frame = CGRect.init(x: gifImageView.frame.maxX + 10, y: typeLabel.frame.maxY, width: bounds.width - gifImageView.bounds.width, height: 0)
    }
    
    public var params = (gif:String(),type:String(),operat:String()) {
        didSet{
            if let data = loadFile(fileName: params.gif) {
                let animatedImage = FLAnimatedImage.init(animatedGIFData: data)
                gifImageView.animatedImage = animatedImage
                /** 通过kvc设置loopCountdown属性,可以控制gif的最大循环次数
                 */
                gifImageView.setValue(3, forKey: "loopCountdown")
            }
            typeLabel.text = params.type
            operatBtn.setTitle("showAllFrames\(params.operat)", for: .normal)
        }
    }
    
    public var frameParams = (gif:UIImage(),detail:[String:Any]()) {
        didSet{
            gifImageView.image = frameParams.gif
            typeLabel.text = "\(frameParams.detail)"
            kIfDefault = false
            setNeedsLayout()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func getMixImage() -> () {
        //self.gifImageView.image = HBImageManger.instance.getMixImage()
        showFramesHandler?(tag)
    }
}

