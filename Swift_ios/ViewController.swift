//
//  ViewController.swift
//  Swift_ios
//
//  Created by RHCT on 15/12/28.
//  Copyright © 2015年 ZL. All rights reserved.
//


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


