//
//  FeedViewController.swift
//  Dowwn
//
//  Created by Daniel on 9/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    
    var currentUser:PFUser? {
        get {
            return PFUser.currentUser()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.checkForUserSession()
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "This is the title"
        cell.detailTextLabel?.text = "This is the subtitle"
        return cell
    }
    
    
    func checkForUserSession() {
        
        if self.currentUser != nil {
            
            println("User is currently logged in")
            
        } else {
            
            let signupAlert = UIAlertController(title: "Sign Up / Login", message: "Please sign up or log in to continue", preferredStyle: UIAlertControllerStyle.Alert)
            signupAlert.addTextFieldWithConfigurationHandler({ (textField:UITextField!) -> Void in
                textField.placeholder = "Username:"
                textField.textAlignment = NSTextAlignment.Center
            })
            
            signupAlert.addTextFieldWithConfigurationHandler({ (textField:UITextField!) -> Void in
                textField.placeholder = "Password:"
                textField.textAlignment = NSTextAlignment.Center
                textField.secureTextEntry = true
            })
            
            signupAlert.addAction(UIAlertAction(title: "Sign Up", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) -> Void in
                
                let textFieldArray = signupAlert.textFields as? [UITextField]
                
                let usernameTextField = textFieldArray![0]
                let passwordTextField = textFieldArray![1]
                let username = usernameTextField.text
                let password = passwordTextField.text


                let newUser = PFUser()
                newUser.username = username
                newUser.password = password
                
                newUser.signUpInBackgroundWithBlock({ (success:Bool, error:NSError!) -> Void in
                    
                    var alert:UIAlertController?
                    
                    if error != nil {
                        
                        let errorDictionary = error.userInfo as NSDictionary!
                        alert = UIAlertController(title: "Error!", message: errorDictionary["error"] as? NSString, preferredStyle: .Alert)
                        alert?.addAction(UIAlertAction(title: "Try Again", style: .Default, handler: { (action:UIAlertAction!) -> Void in
                            self.checkForUserSession()
                        }))
        
                    } else {
                        alert = UIAlertController(title: "Awesome!", message: "Sign up successful!", preferredStyle: .Alert)
                        alert?.addAction(UIAlertAction(title: "Ok!", style: .Default, handler: { (action:UIAlertAction!) -> Void in
                            //                            self.checkForUserSession()
                        }))
                    }
                    
                    self.presentViewController(alert!, animated: true, completion: nil)
                })
                
            }))
            
            signupAlert.addAction(UIAlertAction(title: "Log in", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) -> Void in
                
                let textFieldArray = signupAlert.textFields as? [UITextField]

                let usernameTextField = textFieldArray![0]
                let passwordTextField = textFieldArray![1]
                let username = usernameTextField.text
                let password = passwordTextField.text

                PFUser.logInWithUsernameInBackground(username, password: password, block: { (user:PFUser!, error:NSError!) -> Void in
                    var alert:UIAlertController?
                    
                    if error != nil {
                        
                        let errorDictionary = error.userInfo as NSDictionary!
                        alert = UIAlertController(title: "Error!", message: errorDictionary["error"] as? NSString, preferredStyle: .Alert)
                        alert?.addAction(UIAlertAction(title: "Try Again", style: .Default, handler: { (action:UIAlertAction!) -> Void in
                            self.checkForUserSession()
                        }))
//                        
                    } else {
                        alert = UIAlertController(title: "Awesome!", message: "Log in successful!", preferredStyle: .Alert)
                        alert?.addAction(UIAlertAction(title: "Ok!", style: .Default, handler: { (action:UIAlertAction!) -> Void in
//                            self.checkForUserSession()
                        }))
                    }
                    
                    self.presentViewController(alert!, animated: true, completion: nil)
                })
            }))
            
            
            self.presentViewController(signupAlert, animated: true, completion: nil)
        }
    }
    
    
    
    //MARK: UITableViewDelegate
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
