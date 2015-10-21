//
//  player.swift
//  poke
//
//  Created by 李昊 on 15/10/21.
//  Copyright © 2015年 李昊. All rights reserved.
//

import Foundation

class player {
    var Pokers:[Poker] = []
    var score:Int = 0
    var name:String = ""
    var flag = [String:Int]()
    
    init(name newName:String){
        self.name = newName
        self.score = 0
        self.Pokers = []
        self.flag = [:]
    }
    
    func getpokers(pokers Pokers_all:Poker_s,totalplayer tnum:Int,playernum pnum:Int,index Index:Int){
        
        let Len=(pnum == tnum) ? 54 : (Index+tnum/pnum)
        
        for(var i=Index;i<Len;i++){
            
            self.Pokers.append(Pokers_all.Pokers[i])
            self.flag[Pokers_all.Pokers[i].description()] = self.Pokers.count-1
            
        }
    }
    
    func usecard(index Index:Int){
        self.flag[self.Pokers[Index].description()] = -1
    }
}