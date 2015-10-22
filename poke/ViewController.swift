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
        
        let playernums = 3
        
        var index = 0
        
        Poker_all.Shuffle()
        
        for i in 1...playernums{
            let tmp = Player(name: String(i))
            index = tmp.getpokers(pokers: Poker_all, totalplayer: playernums, playernum: i, index: index)
            players.append(tmp)
        }
        
        for i in players{
            for j in i.Pokers{
                print(j.description(),terminator: " ")
            }
            print("")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

