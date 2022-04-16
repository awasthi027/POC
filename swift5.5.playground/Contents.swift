import UIKit

/*
 Codable synthesis for enums with associated values
 SE-0295 upgrades Swift’s Codable system to support writing enums with associated values. Previously enums were only supported if they conformed to RawRepresentable, but this extends support to general enums as well as enum cases with any number of Codable associated values
 */
/*
enum Weather: Codable {
    case sun
    case wind(speed: Int)
    case rain(amount: Int, chance: Int)
}
let forecast: [Weather] = [
    .sun,
    .wind(speed: 10),
    .sun,
    .rain(amount: 5, chance: 50)
]

func testCodableEnum() {
    do {
        let result = try JSONEncoder().encode(forecast)
        let jsonString = String(decoding: result, as: UTF8.self)
        print(jsonString)
    } catch {
        print("Encoding error: \(error.localizedDescription)")
    }

}
testCodableEnum()
 
 */

/* Extend property wrappers to function and closure parameters
 SE-0293 extends property wrappers so they can be applied to parameters for functions and closures. Parameters passed this way are still immutable unless you take a copy of them, and you are still able to access the underlying property wrapper type using a leading underscore if you want.

 As an example, we could write a function that accepts an integer and prints it out:
 */

/*
@propertyWrapper
struct Clamped<T: Comparable> {
    let wrappedValue: T

    init(wrappedValue: T, range: ClosedRange<T>) {
        self.wrappedValue = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
}
func setScore2(@Clamped(range: 0...100) to score: Int) {
    print("Setting score to \(score)")
}

setScore2(to: 50)
setScore2(to: -50)
setScore2(to: 500)
 
*/

/* async let bindings
 SE-0317 introduces the ability to create and await child tasks using the simple syntax async let. This is particularly useful as an alternative to task groups where you’re dealing with heterogeneous result types – i.e., if you want tasks in a group to return different kinds of data.

 To demonstrate this, we could create a struct that has three different types of properties that will come from three different async functions:
 */

struct UserData {
    let name: String
    let friends: [String]
    let highScores: [Int]
}

func getUser() async -> String {
    "Taylor Swift"
}

func getHighScores() async -> [Int] {
    [42, 23, 16, 15, 8, 4]
}

func getFriends() async -> [String] {
    ["Eric", "Maeve", "Otis"]
}

func printUserDetails() async {
      let username = await getUser()
     let scores = await getHighScores()
      let friends = await getFriends()
    let user = UserData(name: username, friends: friends, highScores: scores)
    print("Hello, my name is \(user.name), and I have \(user.friends.count) friends!")
}
enum NumberError: Error {
    case outOfRange
}

func fibonacci(of number: Int) async throws -> Int {
    if number < 0 || number > 22 {
        throw NumberError.outOfRange
    }

    if number < 2 { return number }
    async let first = fibonacci(of: number - 2)
    async let second = fibonacci(of: number - 1)
    return try await first + second
}
func doRegularWork() {
    Task {
       try await fibonacci(of: 10)
    }
}
