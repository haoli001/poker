//
//  poke.swift
//  poke
//
//  Created by 李昊 on 15/10/21.
//  Copyright © 2015年 李昊. All rights reserved.
//

import Foundation

import UIKit

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<self.count
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}

class Poker{
    var Suite:String
    var CardNumber:String
    
    init(Suite newSuite:String,CardNumber newCardNumber:String){
        self.CardNumber=newCardNumber
        self.Suite=newSuite
    }
    
    func description()->String{
        return "\(self.Suite)\(self.CardNumber)"
    }
    /*
    func show(j:Int, x:Int , y:Int , type :Bool = false) -> UIImageView{
        let img = UIImage(named:self.description())    //初始化图片
        let vImg = UIImageView(image: img);   //初始化图片View
        //   vImg.frame.origin = CGPoint(x:0,y:20);   //指定图片显示的位置
      //  let image:UIImage? = UIImage(named: "test.png")
       // let imageView: UIImageView = UIImageView()
        
        
        
        vImg.frame = CGRect(x:x+16*j*( type ? 1 : 0 ),y:y+16*j*(type ? 0 : 1),width:60,height:80);   //指定图片的位置以及显示的大小
        return vImg
    }
    */
    func show(j:Int, x:Int , y:Int , type :Bool = false) -> UIButton{
       /* let img = UIImage(named:self.description())    //初始化图片
        let vImg = UIImageView(image: img);   //初始化图片View
        //   vImg.frame.origin = CGPoint(x:0,y:20);   //指定图片显示的位置
        //  let image:UIImage? = UIImage(named: "test.png")
        // let imageView: UIImageView = UIImageView()
        vImg.image = img!
        /////设置允许交互属性
        vImg.userInteractionEnabled = true
        
        /////添加tapGuestureRecognizer手势
        let tapGR = UITapGestureRecognizer(target: self, action: "tapHandler:")
        vImg.addGestureRecognizer(tapGR)
        
        //////手势处理函数
        
        vImg.frame = CGRect(x:x+16*j*( type ? 1 : 0 ),y:y+16*j*(type ? 0 : 1),width:60,height:80);   //指定图片的位置以及显示的大小
        return vImg*/
        
        let btn:UIButton = UIButton()
        btn.frame = CGRect(x:x+16*j*( type ? 1 : 0 ),y:y+16*j*(type ? 0 : 1),width:60,height:80)
        btn.setBackgroundImage(UIImage(named:self.description()),forState:UIControlState.Normal)
        btn.addTarget(self, action: Selector("buttonOnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }
    func buttonOnClick() {
        print("点击了铵键")
        // self.btn.backgroundColor=UIColor.greenColor()
    }
    
}

class Poker_s{
    var Pokers:[Poker] = []
    let col:[String] = ["S","D","H","C"]
    let nums:[String] = ["14","02","03","04","05","06","07","08","09","10","11","12","13"]
    var flag = [String:Bool]()
 
    init(){
        self.flag = [:]
    }
    
    func reset(let type:Bool = true){
        self.Pokers.removeAll()
        for(var i=0;i<4;i++){
            for(var j=0;j<13;j++){
                let tmpp:Poker = Poker(Suite: col[i],CardNumber: nums[j])
                Pokers.append(tmpp)
            }
        }
        if(type == true){
            let tmpp1:Poker = Poker(Suite: "J",CardNumber: "01")
            self.Pokers.append(tmpp1)
            let tmpp2:Poker = Poker(Suite: "J",CardNumber: "02")
            self.Pokers.append(tmpp2)
        }
            }
    
    func Shuffle(let type:Bool = true){
        self.reset(type)
        Pokers.shuffle()
    }
    
  /*  func show( x:Int , y:Int , type :Bool = false) -> [UIImageView]{
        
        var vImgs:[UIImageView] = []
            for j in 0..<self.Pokers.count{
                if(self.flag[Pokers[j].description()] == true){
                    vImgs.append(self.Pokers[j].show(j,x: x,y: y, type: type))
                }
            }
        return vImgs
    }*/
    func show( x:Int , y:Int , type :Bool = false) -> [UIButton]{
        
        var vImgs:[UIButton] = []
        for j in 0..<self.Pokers.count{
            if(self.flag[Pokers[j].description()] == true){
                vImgs.append(self.Pokers[j].show(j,x: x,y: y, type: type))
            }
        }
        return vImgs
    }
  
    //18640965501
}
