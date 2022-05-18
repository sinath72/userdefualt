//
//  ViewController.swift
//  userdefault
//
//  Created by Sina Taherkhani on 6/15/1400 AP.
//

import UIKit

class ViewController: UIViewController {
    let UserSource = userData()
    var currentuser:user! = nil
    @IBOutlet var password: UITextField!
    @IBOutlet var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.UserSource.delegate=self
    }

    @IBAction func btn_login(_ sender: Any) {
        UserSource.userData(username: self.username.text, pasword: self.password.text)
    }
    @IBAction func btn2(_ sender: Any) {
        UserSource.getUserInfo()
    }
    
}
extension ViewController: UserDataDelegate{
    func user(data: user) {
        print("user=\(data.getUsername())")
        currentuser=data
        self.performSegue(withIdentifier: "go_to_loged_in", sender: self)
    }
    
    func faild(error: String) {
        print("error=\(error)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! loggedin
        dvc.user=self.currentuser
    }
    
}

