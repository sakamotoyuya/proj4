//
//  ArcTest.swift
//  proj4
//
//  Created by sakamotoyuya on 2019/03/31.
//  Copyright © 2019 sakamotoyuya. All rights reserved.
//

import UIKit

class ArcTest: NSObject {
    var a:A?
    var b:B?
    var c = C.shared//c → Cを強参照???
    /// コンストラクタ
    override init(){
        super.init()
        callA()
//        callB()
//        callC()
    }
    
    func callA(){
        a = A{print(self)}//(2)クロージャー → 渡された引数のself(ArcTest)を強参照
        a?.clo?()
    }
    
    func callB(){
        b = B()
        b?.clo?()
    }
    
    func callC(){
        C.shared.arc = self
        DispatchQueue.global().async {
            // 重たい処理
            DispatchQueue.main.async {
                // UIを更新する処理
                print(self)
            }
        }
    }
    deinit { print("ArcTestを解放しました") }
}

//テスト1
class A:NSObject {
    var clo:(()->())?//(3)clo → クロージャーを強参照
    init(clo:@escaping ()->()){
        super.init()
        self.clo = clo
    }
    deinit { print("Aを解放しました") }
}

//テスト2 B内でクロージャーからセルフを参照した場合
class B:NSObject {
    var clo:(()->())?//(1)clo → クロージャーを強参照
    override init(){
        super.init()
        clo = {
            print(self)//(2)クロージャー → Bを強参照で循環参照
        }
    }
    deinit { print("Bを解放しました") }
}

//テスト3 スタティックの確認
class C:NSObject{
    static let shared = C()
    var arc:ArcTest?
    private override init(){}//privateで隠して、init呼べないようにしちゃいます。
    deinit { print("Cを解放しました") }//staticだから解放されるわけがない。。。念の為。
}
