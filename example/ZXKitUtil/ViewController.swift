//
//  ViewController.swift
//  ZXKitUtil
//
//  Created by Damon on 2020/7/2.
//  Copyright © 2020 Damon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        ZXKitUtil.shared.openAppStoreReviewPage(openType: .app)
        
        let filePath = Bundle.main.path(forResource: "1594468497552.mp4", ofType: "")
        if let path = filePath {
            let duration = ZXKitUtil.shared.getVideoDuration(videoURL: URL(fileURLWithPath: path))
            print("时间: ", duration)
            
            let size = ZXKitUtil.shared.getVideoSize(videoURL: URL(fileURLWithPath: path))
            print("size: ", size)
            
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                print(data.zx.encryptString(encryType: .sha1))
            }
            
        }
        
        /** 可以通过单例进行调用 */
        
        //角度渐变图片
        _ = ZXKitUtil.shared.getRadialGradientImage(colors: [UIColor.red, UIColor.black, UIColor.blue], raduis: 45)
        //线性渐变图片
        _ = ZXKitUtil.shared.getLinearGradientImage(colors:  [UIColor.red, UIColor.black, UIColor.blue], directionType: .leftToRight)
        //16进制颜色转为UIColor
        _ =  UIColor.zx.color(hexValue: 0xffffff)
        //16进制字符串转为UIColor
        _ = UIColor.zx.color(hexString: "#FFFFFF")
        //获取导航栏高度
        _ = ZXKitUtil_Default_NavigationBar_Height(vc: self)
        
        /** 对部分数据类型的函数的功能扩充可以使用zx的链式调用 */
        
        //16进制颜色转为UIColor
        _ = UIColor.zx.color(hexValue: 0xffffff)
        //md5加密
        _ = "哈哈是电话费".zx.encryptString(encryType: ZXKitUtilEncryType.md5)
        //sha加密
        _ = "sha1加密".zx.encryptString(encryType: ZXKitUtilEncryType.sha1)
        _ = "哈哈是电话费".zx.encryptString(encryType: ZXKitUtilEncryType.sha256)
        //base64加密
        _ = "哈哈是电话费".zx.encryptString(encryType: ZXKitUtilEncryType.base64)
        //base64解码
        _ = "5ZOI5ZOI5piv55S16K+d6LS5".zx.base64Decode()
        //字符串转unicode
        _ = "哈哈是电话费".zx.unicodeEncode()
        //unicode转中文
        _ = "\\u54c8\\u54c8\\u54c8".zx.unicodeDecode()
        
        //软件版本
        _ = ZXKitUtil.shared.getAppVersionString()
        //软件构建版本
        _ = ZXKitUtil.shared.getAppBuildVersionString()
        //获取唯一标识
        _ = ZXKitUtil.shared.getIDFAString()
        
        //比较时间
        _ = Date().zx.compare(anotherDate: Date(timeIntervalSince1970: 1000), ignoreTime: true)
        
        //更安全快捷的截取字符串
        let string = "截取字符串"
        print(string.zx.subString(rang: NSRange(location: 2, length: 5)))
        
        //获取文件路径
        print(ZXKitUtil.shared.getFileDirectory(type: .home).absoluteString)
        
        //手机震动
        ZXKitUtil.shared.startVibrate(repeated: true)
        
        //五秒之后结束震动
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            ZXKitUtil.shared.stopVibrate()
        }
        
        //播放音乐
        ZXKitUtil.shared.playMusic(url: URL(string: "https://file-fat.shinningmorning.com/voice/voice_xiongdi.m4a"), repeated: true)
        
        self.createUI()
    }
    
    func createUI() {
        let button = UIButton(type: .custom)
        let image = ZXKitUtil.shared.getLinearGradientImage(colors:  [UIColor.red, UIColor.black, UIColor.blue], directionType: .leftToRight)
        button.setImage(image, for: .normal)
        self.view.addSubview(button)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        button.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        
        let button2 = UIButton(type: .custom)
        let image2 = ZXKitUtil.shared.getRadialGradientImage(colors: [UIColor.red, UIColor.black, UIColor.blue], raduis: 45)
        button2.setImage(image2, for: .normal)
        self.view.addSubview(button2)
        button2.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        
        button2.addTarget(self, action: #selector(playMusic), for: UIControl.Event.touchUpInside)
    }
    
    @objc func click() {
        let url = Bundle.main.url(forResource: "click", withExtension: "caf")
        ZXKitUtil.shared.playEffect(url: url, vibrate: true)
    }
    

    @objc func playMusic() {
        let url = Bundle.main.url(forResource: "空谷", withExtension: "wav")
        ZXKitUtil.shared.playMusic(url: url, repeated: false)
        
        
    }
}

