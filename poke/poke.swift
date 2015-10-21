//
//  poke.swift
//  poke
//
//  Created by 李昊 on 15/10/21.
//  Copyright © 2015年 李昊. All rights reserved.
//

import Foundation

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
        return "\(self.Suite)\(self.Suite)"
    }
    
}

class Poker_s{
    var Pokers:[Poker] = []
    let col:[String] = ["S","D","H","C"]
    let nums:[String] = ["14","02","03","04","05","06","07","08","09","10","11","12","13"]
    var flag:[Bool] = [Bool](count:54,repeatedValue:true)
    
    
    init(){
        self.reset()
    }
    
    func reset(){
        for(var i=0;i<4;i++){
            for(var j=0;j<13;j++){
                let tmpp:Poker = Poker(Suite: col[i],CardNumber: nums[j])
                Pokers.append(tmpp)
            }
        }
        let tmpp1:Poker = Poker(Suite: "J",CardNumber: "01")
        self.Pokers.append(tmpp1)
        let tmpp2:Poker = Poker(Suite: "J",CardNumber: "02")
        self.Pokers.append(tmpp2)
        self.flag = [Bool](count:54,repeatedValue:true)
    }
    
    func Shuffle(){
        self.reset()
        Pokers.shuffle()
    }
}
