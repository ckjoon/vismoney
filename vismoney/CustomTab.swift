//
//  CustomTab.swift
//  vismoney
//
//  Created by Yeon Joon Choi on 9/25/16.
//  Copyright © 2016 Yeon Joon Choi. All rights reserved.
//

import UIKit

class CustomTab: UITabBarController {
    
    @IBInspectable var defaultIndex: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
    }
    
}