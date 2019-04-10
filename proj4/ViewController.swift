//
//  ViewController.swift
//  proj4
//
//  Created by sakamotoyuya on 2019/04/09.
//  Copyright © 2019 sakamotoyuya. All rights reserved.
//

import UIKit

/// arcテスト用を操作します。
/// ボタンを押すことで解放の仕組みが確認可能です。
class ViewController: UIViewController {
    
    /// arcテスト用
    var arc:ArcTest? = ArcTest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /// aを解放
    ///
    /// - Parameter sender:
    @IBAction func kaihou1(_ sender: Any) {
        arc?.a = nil
    }
    
    /// bを解放
    ///
    /// - Parameter sender:
    @IBAction func kaihou2(_ sender: Any) {
//        arc?.b = nil
    }
    
    /// インスタンスを解放
    ///
    /// - Parameter sender:
    @IBAction func kaihou3(_ sender: Any) {
        arc = nil
    }
    
    /// インスタンス再生成
    ///
    /// - Parameter sender:
    @IBAction func arcseisei(_ sender: Any) {
        arc = ArcTest()
    }
    
    @IBAction func confirm(_ sender: Any) {
        print("(1)arc:\(arc)")
//        print("(2)A.a:\(A.a)")
        print("(2)arc.a:\(arc?.a)")
//        print("(3)arc.a.clo:\(arc?.a?.clo)")
//        print("(3)arc.b:\(arc?.b)")
//        print("(4)arc.a.b:\(arc?.a?.b)")
//        print("(5)arc.b.a:\(arc?.b?.a)")
    }
}
