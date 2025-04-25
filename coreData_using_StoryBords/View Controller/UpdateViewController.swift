//
//  UpdateViewController.swift
//  coreData_using_StoryBords
//
//  Created by TirthShah on 23/04/25.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnUpdateData: UIButton!
    
    
    
    var username = ""
    var name = ""
    var email = ""
    var phoneNumber = ""
    var password = ""
    
    
    
    @IBAction func btn_Update(_ sender: Any) {
        let contextref = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let student_Data = Student(context: contextref)
        
        student_Data.username = txtUserName.text!
        student_Data.name = txtName.text!
        student_Data.email = txtEmail.text!
        student_Data.password = txtPassword.text!
        student_Data.phone_number = txtPhoneNumber.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let alert = UIAlertController(title: "Alert", message: "update Data", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserName.text = username
        txtName.text = name
        txtEmail.text = email
        txtPhoneNumber.text = phoneNumber
        txtPassword.text = password
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
