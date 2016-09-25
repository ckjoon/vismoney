//
//  SetBudgetViewController.swift
//  vismoney
//
//  Created by Yeon Joon Choi on 9/24/16.
//  Copyright © 2016 Yeon Joon Choi. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class SetBudgetViewController: UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var budget: UITextField!
    @IBOutlet weak var lname: UILabel!
    @IBOutlet weak var fname: UILabel!
    var rootref = FIRDatabase.database().reference()
    var userId = FIRAuth.auth()!.currentUser!.uid
    
    @IBAction func confirmButton(sender: AnyObject) {
        let budget = Int(self.budget.text!)
        rootref.child(userId).updateChildValues(["budget":budget!])
        rootref.child(userId).updateChildValues(["remainder":budget!])
        print("updated \(budget)");
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var json:JSON!
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://api.reimaginebanking.com/customers/57e690bedbd83557146123d6/accounts?key=dede0cc64d854e9478fff871c2f40f46")!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                json = JSON(data: jsonData)
                print(json)
                let balance = json[0]["balance"].stringValue
                print(balance)
                var userId = FIRAuth.auth()!.currentUser!.uid
                dispatch_async(dispatch_get_main_queue(), {
                    self.balance.text = String(balance)
                    self.rootref.child(userId).updateChildValues(["balance":Int(balance)!])
                })

                
                
                
                
            }
        })
        task.resume()

        
        rootref.child(userId).observeSingleEventOfType(.Value, withBlock: {(snapshot) in
            let first = snapshot.value!["first_name"] as! String
            let last = snapshot.value!["last_name"] as! String
            self.fname.text=first;
            self.lname.text=last;
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = true
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
