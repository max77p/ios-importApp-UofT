import Foundation

class Employee{
    var firstName: String
    var lastName: String
    var salary: Int
    
    init(data:JSON){
        
        firstName=data["first_name"].stringValue
        lastName=data["last_name"].stringValue
        salary=data["salary"].intValue
        
    }
}
