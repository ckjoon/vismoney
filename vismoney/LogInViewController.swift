//
//  LogInViewController.swift
//  vismoney
//
//  Created by Yeon Joon Choi on 9/24/16.
//  Copyright © 2016 Yeon Joon Choi. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = FIRAuth.auth()?.currentUser

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
    @IBAction func createAccount(sender: AnyObject) {
        if self.emailField.text == "" || self.passwordField.text==""{
            let alertController = UIAlertController(title:"oops", message: "Please enter an email and password.", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title:"OK", style: .Cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.presentViewController(alertController,animated: true, completion: nil)
            
        }else{
            FIRAuth.auth()?.createUserWithEmail(self.emailField.text!, password: self.passwordField.text!, completion: {(user, error) in
                
                if error == nil{
                    self.logoutButton.alpha = 1.0
                    self.usernameLabel.text = user!.email
                    self.emailField.text=""
                    self.passwordField.text=""
                }else{
                    let alertController = UIAlertController(title:"oops", message: "Please enter an email and password.", preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title:"OK", style: .Cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.presentViewController(alertController,animated: true, completion: nil)
                    
                }
            })
        }
    }
    @IBAction func loginAction(sender: AnyObject) {
        if self.emailField.text == "" || self.passwordField.text==""{
            let alertController = UIAlertController(title:"oops", message: "Please enter an email and password.", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title:"OK", style: .Cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.presentViewController(alertController,animated: true, completion: nil)
            
        }else{
            FIRAuth.auth()?.signInWithEmail(self.emailField.text!, password: self.passwordField.text!, completion: {(user, error) in
                
                if error == nil{
                    self.emailField.text=""
                    self.passwordField.text=""
                    self.performSegueWithIdentifier("login", sender: self)
                }else{
                    let alertController = UIAlertController(title:"oops", message: "Please enter an email and password.", preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title:"OK", style: .Cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.presentViewController(alertController,animated: true, completion: nil)
                    
                }
            })

            
        }
        
    }
    @IBAction func logoutAction(sender: AnyObject) {
        try! FIRAuth.auth()?.signOut()
        self.usernameLabel.text=""
        self.logoutButton.alpha=0.0
        self.emailField.text=""
        self.passwordField.text=""

    }

}
