//
//  ViewDataViewController.swift
//  coreData_using_StoryBords
//
//  Created by TirthShah on 22/04/25.
//

import UIKit
import CoreData

class ViewDataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var MyTableView: UITableView!
    
    
    var student_data : [Student] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let student = self.student_data[indexPath.row]
        cell.textLabel?.text = student.name!
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let updateVC = self.storyboard?.instantiateViewController(identifier: "updateVC") as? UpdateViewController else { return }
        updateVC.name = self.student_data[indexPath.row].name!
        updateVC.email = self.student_data[indexPath.row].email!
        updateVC.password = self.student_data[indexPath.row].password!
        updateVC.username = self.student_data[indexPath.row].username!
        updateVC.phoneNumber = self.student_data[indexPath.row].phone_number!
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let student = self.student_data[indexPath.row]
        context.delete(student)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.pushViewController(updateVC, animated: true)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            // Delete the row from the data source
            let student = self.student_data[indexPath.row]
            context.delete(student)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                            student_data = try context.fetch(Student.fetchRequest())
                        }
                        catch {
                            print("Fatch Delete Error")
                        }
                        MyTableView.reloadData()
            
        } else if editingStyle == .insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getdata()
        MyTableView.reloadData()
    }
    func getdata() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            student_data = try context.fetch(Student.fetchRequest())
            print(student_data)
            MyTableView.reloadData()
        }
        catch {
            print("Fatch Error")
        }
        MyTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MyTableView.dataSource = self
        self.MyTableView.delegate = self
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
