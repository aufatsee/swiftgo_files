//
//  ViewController.swift
//  ExUIAlert
//
//  Created by joe feng on 2016/5/16.
//  Copyright © 2016年 hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.mainScreen().bounds.size

        // 設置一個按下會顯示簡單提示的按鈕
        var myButton = UIButton(type: .System)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("簡單提示", forState: .Normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(ViewController.simpleHint), forControlEvents: .TouchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(myButton)
        
        // 設置一個按下會顯示確認及取消提示的按鈕
        myButton = UIButton(type: .System)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("送出", forState: .Normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(ViewController.confirm), forControlEvents: .TouchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        self.view.addSubview(myButton)
        
        // 設置一個按下會提示刪除的按鈕
        myButton = UIButton(type: .System)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("刪除", forState: .Normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(ViewController.deleteSomething), forControlEvents: .TouchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.45)
        self.view.addSubview(myButton)
    
        // 設置一個按下會提示登入的按鈕
        myButton = UIButton(type: .System)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("登入", forState: .Normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(ViewController.login), forControlEvents: .TouchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.6)
        self.view.addSubview(myButton)
        
        // 設置一個按下會從底部彈出提示的按鈕
        myButton = UIButton(type: .System)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        myButton.setTitle("底部提示", forState: .Normal)
        myButton.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myButton.addTarget(nil, action: #selector(ViewController.bottomAlert), forControlEvents: .TouchUpInside)
        myButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.75)
        self.view.addSubview(myButton)
    }
    
    func simpleHint() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "提示", message: "一個簡單提示，請按確認繼續", preferredStyle: .Alert)

        // 建立[確認]按鈕
        let okAction = UIAlertAction(title: "確認", style: .Default, handler: {
            (action: UIAlertAction!) -> Void in
            print("按下確認後，閉包裡的動作")
        })
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    func confirm() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "送出", message: "確認要送出了嗎？", preferredStyle: .Alert)
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[送出]按鈕
        let okAction = UIAlertAction(title: "送出", style: .Default, handler: nil)
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func deleteSomething() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "刪除", message: "刪除字樣會變紅色的", preferredStyle: .Alert)
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)

        // 建立[刪除]按鈕
        let okAction = UIAlertAction(title: "刪除", style: .Destructive, handler: nil)
        alertController.addAction(okAction)

        // 顯示提示框
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func login() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "登入", message: "請輸入帳號與密碼", preferredStyle: .Alert)
        
        // 建立兩個輸入框
        alertController.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "帳號"
        }
        alertController.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            textField.placeholder = "密碼"
            
            // 如果要輸入密碼 這個屬性要設定為 true
            textField.secureTextEntry = true
        }

        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[登入]按鈕
        let okAction = UIAlertAction(title: "登入", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
            let acc = (alertController.textFields?.first)! as UITextField
            let password = (alertController.textFields?.last)! as UITextField
            
            print("輸入的帳號為：\(acc.text)")
            print("輸入的密碼為：\(password.text)")
        }
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func bottomAlert() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "底部提示", message: "這個提示會從底部彈出", preferredStyle: .ActionSheet)
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(title: "確認", style: .Default, handler: nil)
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
