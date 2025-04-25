//
//  AddDataViewController.swift
//  coreData_using_StoryBords
//
//  Created by TirthShah on 22/04/25.
//

import UIKit
import CoreData

class AddDataViewController: UIViewController {

    
    
    @IBOutlet weak var txt_UserName: UITextField!
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_PhoneNumber: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    @IBAction func btn_AddData(_ sender: Any) {
        
        let contextref = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let student_Data = Student(context: contextref)
        
        student_Data.username = txt_UserName.text!
        student_Data.name = txt_Name.text!
        student_Data.email = txt_Email.text!
        student_Data.password = txt_password.text!
        student_Data.phone_number = txt_PhoneNumber.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let alert = UIAlertController(title: "Alert", message: "Data Add", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
