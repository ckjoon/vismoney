//
//  ChooseBankViewController.swift
//  vismoney
//
//  Created by Yeon Joon Choi on 9/24/16.
//  Copyright © 2016 Yeon Joon Choi. All rights reserved.
//

import UIKit

class ChooseBankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    var logos = [UIImage(named: "c1"),UIImage(named: "ba"),UIImage(named: "chase"),UIImage(named: "citi"),UIImage(named: "wf"),UIImage(named: "pnc"),UIImage(named: "td"),UIImage(named: "delta"),UIImage(named: "usaa")]
    
    var banks = ["Capital One", "Bank of America", "Chase", "Citibank", "Wells Fargo", "PNC Bank", "TD Bank", "Delta Community", "USAA"]
    var icons = UIImage(named: "arrow")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.table.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! banksTableViewCell
        cell.logo.image = logos[indexPath.row]
        cell.bank.text = banks[indexPath.row]
        cell.icon.image = icons;
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("c1login", sender: self)
        

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
