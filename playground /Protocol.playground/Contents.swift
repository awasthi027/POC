import UIKit

protocol UserAuthenticationOption {
    var userId: String {get set}
    func login()
    func logout()
    
}

extension UserAuthenticationOption {
    func login() {
        print("Logout login: \(userId)")
    }
    func logout() {
        print("LogOut user:  \(userId)")
    }
}

class FeatureOneController: UserAuthenticationOption {
    var userId: String = "useridFeatureOne"
}

class FeatureTwoController: UserAuthenticationOption {
    var userId: String = "useridFeatureTwo"
    func logoutUser() {
        self.logout()
    }
}

//let obj = FeatureOneController()
//obj.logout()
//
//let obj2 = FeatureTwoController()
//obj2.logout()


protocol Named {
  var name: String { get }
}

protocol Location {
  var currentLocation: String { get }
}

protocol Human: Named {
  var countryOfOrigin: String { get }
  init(name: String, countryOfOrigin: String?)
}

extension Human {
  init(name: String, countryOfOrigin: String? = nil) {
    self.init(name: name, countryOfOrigin: countryOfOrigin)
  }
}
protocol Greet: Human {
    func sayHello()
}


struct Icarus: Human,Location,Greet {
   var currentLocation: String
    let name: String
   let countryOfOrigin: String
    func sayHello() {
        print("Hello, \(name) My Location: \(self.currentLocation),countryOfOrigin: \(String(describing: countryOfOrigin))")
   }
}

let iObj = Icarus.init(currentLocation: "BLR, White Field", name: "Ashish", countryOfOrigin: "India")
iObj.sayHello()
