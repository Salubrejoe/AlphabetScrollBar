import Foundation


// Protocol for items that can be sorted alphabetically.
public protocol Alphabetizable: Identifiable {
  var id: String { get }
  var name: String { get }
}
