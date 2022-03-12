import UIKit

//class Car {
//
//    var name = "Mercedes"
//}
//
//enum Direction {
//    case n, s, e, w
//}
//
//func update(vehicle:Car, direction: Direction) {
//
//    let newVehicle = vehicle
//    vehicle.name = "BMW"
//
//    var newDirc = direction
//    newDirc = .w
//    print("\(vehicle.name), \(newVehicle.name)")
//    print("\(direction), \(newDirc)")
//}
//
//update(vehicle: Car(), direction: .e)

//import Foundation
//
//class Obj: NSObject {
//    var c: (()->())?
//
//    deinit {
//        print("deinit")
//    }
//}
//
//func execute() {
//
//    let ob = Obj()
//    ob.c = {
//        print(ob.description)
//    }
//    print("method end")
//}
//
//execute()


//var things = "cars"
//let clouure = {
//    print("l Love \(things)")
//}
//
//things = "Airplanaes"
//
//clouure()

//func method() {
//    print("A")
//    DispatchQueue.main.async {
//        print("B")
//        DispatchQueue.main.async {
//            print("C")
//        }
//        DispatchQueue.main.sync {
//            print("D")
//        }
//    }
//    DispatchQueue.main.async {
//        print("E")
//    }
//}
//
//method()

func quickSort(_ list: [Int]) -> [Int] {
    if list.isEmpty {
        return list
    }
    let p = list[list.count / 2]
    let e = list.filter{$0 == p}
    let less = list.filter{$0 < p}
    let max = list.filter{$0 > p}
    return quickSort(less) +  e + quickSort(max)
}

/* Find most repeated number from list in accessing order
 Input [25, 2,3,57,38,41] output  [2, 3, 5]
 Input [25, 2,0,30,10,0] output  [3]
 */

//func solution(a: [Int]) -> [Int] {
//    var hashMap: [Int: Int] = [:]
//    for item in a {
//        if item == 0 {
//            if let item = hashMap[item] {
//                hashMap[item]  = item + 1
//            }else {
//                hashMap[item]  = 1
//            }
//            continue
//        }
//        var number = item
//        while number > 0 {
//            let found =  number % 10
//            number =  number / 10
//            if let item = hashMap[found] {
//                hashMap[found]  = item + 1
//            }else {
//                hashMap[found]  = 1
//            }
//        }
//    }
//    var items: [Int] = []
//    var maxRepeat = 0
//    for (_, value) in hashMap {
//        if value >= maxRepeat {
//            maxRepeat = value
//        }
//    }
//    for (key, value) in hashMap {
//          if  value >= maxRepeat {
//            items.append(key)
//        }
//    }
//
//    return quickSort(items)
//}
//
//var items = solution(a: [25, 2,3,57,38,41])
//print("\(items)")
// items = solution(a: [25, 2,0,30,10,0]) //[25, 2,0,30,10,0]
//print("\(items)")


/* find sequnce repeated string
 
 input: abbaaaac    1a2b4ac
 */

func findCharRepeatSequence(_ inputString: String )->String {
    var temp: String = ""
    var lastChar = ""
    var count = 1
    for char in inputString {
        let str = "\(char)"
        if str == lastChar {
            count += 1
        }else {
            if lastChar != "" {
                temp += "\(count)\(lastChar)"
                count = 1
            }
        }
        lastChar = str
    }
    if lastChar != "" {
        temp += "\(count)\(lastChar)"
    }
    return temp
}

var item = findCharRepeatSequence("abbaaaac")
print("\(item)")
item = findCharRepeatSequence("abbaaaa")
print("\(item)")
