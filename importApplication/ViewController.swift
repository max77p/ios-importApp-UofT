//
//  ViewController.swift
//  importApplication
//
//  Created by Shan Indrakumar on 2019-10-29.
//  Copyright © 2019 CS2680. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {


    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var employees: [Employee]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource=self
        
        if let file=Bundle(for: AppDelegate.self).path(forResource: "company_data1", ofType: "json"), let data=NSData(contentsOfFile: file) as Data?{
           
            let jsonData=JSON(data: data)
            self.parseJSON(json: jsonData)
        }
       
    }
    
    func parseJSON(json:JSON){
        companyLabel.text=json["company"].stringValue
        addressLabel.text=json["address"].stringValue
        emailLabel.text=json["email"].stringValue
        
        employees=[Employee]()
        let employeeDataArray=json["employees"].arrayValue
        
        for employeeData in employeeDataArray{
            self.employees?.append(Employee(data: employeeData))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let employee = employees?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell=UITableViewCell(style: .value1,reuseIdentifier: "")
        cell.textLabel?.text=employee.firstName + " " + employee.lastName
        cell.detailTextLabel?.text = "$\(employee.salary)"
        return cell
    }
    


}

