//
//  BankLoginViewController.swift
//  vismoney
//
//  Created by Yeon Joon Choi on 9/24/16.
//  Copyright © 2016 Yeon Joon Choi. All rights reserved.
//

import UIKit
import SwiftyJSON
import Firebase

class BankLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var json:JSON!
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://api.reimaginebanking.com/customers?key=dede0cc64d854e9478fff871c2f40f46")!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                json = JSON(data: jsonData)
                print(json.rawString())
                print(json[1]["_id"].stringValue);
                print(json[1]["first_name"].stringValue);
                print(json[1]["last_name"].stringValue);
                let rootref =
                    FIRDatabase.database().reference()
                var userId = FIRAuth.auth()!.currentUser!.uid

                rootref.child(userId).setValue(["first_name": json[1]["first_name"].stringValue,"last_name": json[1]["last_name"].stringValue,"_id": json[1]["_id"].stringValue])
                


                

            }
        })
        task.resume()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
