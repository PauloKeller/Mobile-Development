import UIKit

var jsonData = """
[
{
    "roleId": 1,
    "name": "Car"
},
{
    "roleId": 2,
    "name": "Truck"
}
]
""".data(using: .utf8)!

enum VehicleType:String, Codable {
    case car = "Car"
    case truck = "Truck"
}

enum RoleType:Int, Codable {
    case personal = 1
    case corporate = 2
}

class Vehicle: Codable {
    var roleId: RoleType
    var name: VehicleType
}



if let list = try? JSONDecoder().decode([Vehicle].self, from: jsonData) {
    print(list[1].roleId)
    print(list[1].name)
    print(list[0].roleId)
    print(list[0].name)
}
