//
//  player.swift
//  poke
//
//  Created by 李昊 on 15/10/21.
//  Copyright © 2015年 李昊. All rights reserved.
//

import Foundation
import UIKit

class Player {
    var Pokers:Poker_s
    var score:Int = 0
    var name:String = ""
    var flag = [String:Int]()
    
    init(name newName:String){
        self.name = newName
        self.score = 0
        self.flag = [:]
        self.Pokers = Poker_s()
    }
    
    func getpokers(pokers Pokers_all:Poker_s,totalplayer tnum:Int,playernum pnum:Int,index Index:Int) ->Int{

        let Len=(pnum == tnum) ? Pokers_all.Pokers.count : (Index+Pokers_all.Pokers.count/tnum)
        var i=Index
        for(;i<Len;i++){
            
            self.Pokers.Pokers.append(Pokers_all.Pokers[i])
            self.Pokers.flag[Pokers_all.Pokers[i].description()] = true
            
        }
        self.Pokers.Pokers.sortInPlace({p1,p2 in p1.description()<p2.description()});
        return i
    }
    
    func usecard(index Index:String){
        self.Pokers.flag[Index] = false;
    }
    /*
    func show( x:Int , y:Int , type :Bool = false) -> [UIImageView]{
        
        return self.Pokers.show(x, y: y,type: type)
    }*/
    func show( x:Int , y:Int , type :Bool = false) -> [UIButton]{
        
        return self.Pokers.show(x, y: y,type: type)
    }
    
}