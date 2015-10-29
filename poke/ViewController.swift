//
//  ViewController.swift
//  poke
//
//  Created by 李昊 on 15/10/21.
//  Copyright © 2015年 李昊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let Poker_all = Poker_s()
        
        var players = [Player]()
        
        let playernums = 4
        
        var index = 0
        
        Poker_all.Shuffle(false)
        //Poker_all.reset(false)
        
        for i in 1...playernums{
            let tmp = Player(name: String(i))
            index = tmp.getpokers(pokers: Poker_all, totalplayer: playernums, playernum: i, index: index)
            players.append(tmp)
        }
        
        for i in 0..<players.count{
            var x:Int,y:Int
            print(i)
            switch(i){
            case 0:
                x = 160-8*players[i].Pokers.Pokers.count
                y = 500
            case 2:
                x = 160-8*players[i].Pokers.Pokers.count
                y = 20
            case 1:
                x = 300
                y = 250-6*players[i].Pokers.Pokers.count
            default:
                x = 20
                y = 250-6*players[i].Pokers.Pokers.count
                
            }
            
            
            let vImgs:[UIImageView] = players[i].show(x,y: y,type: (i%2 == 0) ? true : false )
            for j in vImgs{
                self.view.addSubview(j);
            }
        }
        players[0].usecard(index: players[0].Pokers.Pokers[0].description())

        for i in 0..<players.count{
            var x:Int,y:Int
            print(i)
            switch(i){
            case 0:
                x = 160-8*players[i].Pokers.Pokers.count
                y = 500
            case 2:
                x = 160-8*players[i].Pokers.Pokers.count
                y = 20
            case 1:
                x = 300
                y = 250-6*players[i].Pokers.Pokers.count
            default:
                x = 20
                y = 250-6*players[i].Pokers.Pokers.count
            
            }
            
            
            let vImgs:[UIImageView] = players[i].show(x,y: y,type: (i%2 == 0) ? true : false )
            for j in vImgs{
            self.view.addSubview(j);
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

