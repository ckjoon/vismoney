//
//  SecondViewController.swift
//  vismoney
//
//  Created by Yeon Joon Choi on 9/24/16.
//  Copyright © 2016 Yeon Joon Choi. All rights reserved.
//

import UIKit
import SwiftyJSON
import Firebase


class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var placeholder1: UIImageView!
    @IBOutlet weak var placeholder2: UIImageView!
    @IBOutlet weak var placeholder3: UIImageView!
    @IBOutlet weak var placeholder4: UIImageView!
    @IBOutlet weak var placeholder6: UIImageView!
    @IBOutlet weak var placeholder5: UIImageView!
    @IBOutlet weak var placeholder7: UIImageView!
    @IBOutlet weak var placeholder8: UIImageView!
    @IBOutlet weak var placeholder9: UIImageView!
    @IBOutlet weak var placeholder10: UIImageView!
    
    
    
    var coinValue: [Double] = [50,20,10,5,1];
    var coinCount: [Double] = [0,0,0,0,0];
    var rootref = FIRDatabase.database().reference()
    var userId = FIRAuth.auth()!.currentUser!.uid
    var balance = 0;
    
    
    
    
    @IBAction func updateAccount(sender: AnyObject) {
        
        var json:JSON!

        let request = NSMutableURLRequest(URL: NSURL(string: "http://api.reimaginebanking.com/customers/57e690bedbd83557146123d6/accounts?key=dede0cc64d854e9478fff871c2f40f46")!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                json = JSON(data: jsonData)
                print(json)
                let balance = Int(json[0]["balance"].stringValue)
                print(balance)
                print(self.balance - balance!);
                
                let remainder = Int(self.dollar.text!)! - self.balance + balance!;
                self.rootref.child(self.userId).updateChildValues(["remainder":remainder])
                dispatch_async(dispatch_get_main_queue(), {
                    self.dollar.text = String(remainder)
                })
            }
        })
        task.resume()


        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var places: [UIImageView] = [self.placeholder1,self.placeholder2,self.placeholder3,self.placeholder4,self.placeholder5,self.placeholder6, self.placeholder7,self.placeholder8,self.placeholder9,self.placeholder10]
        

        rootref.child(userId).observeSingleEventOfType(.Value, withBlock: {(snapshot) in
            let budget = snapshot.value!["budget"] as! Int
            let balance = snapshot.value!["balance"] as! Int
            var dollar = String(budget)
            dispatch_async(dispatch_get_main_queue(), {
                self.dollar.text=dollar;
                self.balance = balance
            })
            
            
        })
        
    }
}
