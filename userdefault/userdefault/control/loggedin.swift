//
//  loggedin.swift
//  userdefault
//
//  Created by Sina Taherkhani on 6/15/1400 AP.
//

import UIKit

class loggedin: UIViewController {

    @IBOutlet var lbl_user: UILabel!
    var user:user! = nil
    let userSource = userData()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("show")
        if (self.user != nil) {
            lbl_user.text = self.user.getUsername()
            print(self.user.getUsername()+"ll")
        }else{
            self.user=userSource.getUserObjects()
            lbl_user.text = self.user.getUsername()
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
