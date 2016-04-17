//
//  ViewController.swift
//  Swift_ios
//
//  Created by RHCT on 15/12/28.
//  Copyright © 2015年 ZL. All rights reserved.
//

enum Coin: Int {
    case SilverDollar = 100
    case HalfDollar = 50
    case Quarter = 25
    case Dime = 10
    case Nickel = 5
    case Penny = 1
    
    static func coinsInDescendingOrder() -> [Coin] {
        return [
            Coin.SilverDollar,
            Coin.HalfDollar,
            Coin.Quarter,
            Coin.Dime,
            Coin.Nickel,
            Coin.Penny,
        ]
    }
}


class ViewController: BaseViewController {
    
    deinit {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TaskService.getTasks({ (tasks) -> Void in
            logger.debug("\(tasks)")
            }) { (statusCode) -> Void in
                logger.debug("\(statusCode)")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


