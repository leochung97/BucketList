//
//  ConformanceNotes.swift
//  BucketList
//
//  Created by Leo Chung on 1/22/24.
//

import SwiftUI

/*
 One way to sort based on closure is to do the sorting by providing a closure
 .sorted {
    $0.lastName < $1.lastName
 }
 
 However, this is not an ideal solution:
 1. This is model data, by which I mean that it's affecting the way we work with the User struct -> the struct and its properties are our data model, and in a well-developed application we don't really want to tell the model how it should behave inside our SwiftUI application
 2. If we sort User arrays in multiple places, we could accidentally end up changing the sorting logic -> all of the closures need to be updated if we want to sort everywhere
 
 Instead, we can make our own types conform to Comparable and then also get a sorted() method with no parameters:
 1. Add the Comparable conformance to the definition of User
 2. Add a method called < that takes two users and returns true if the first should be sorted before the second
 The operator is called overloading and it is used to represent "less than" in terms of sorting
 lhs and rhs are coding conventions short for left handside and right handside -> they are used because the < operator has one operand on its left and right
 This method MUST return a Boolean, which means we must decide whether one object should be sorted before another -> this is handled by another protocol called Equatable
 The method must be marked as static, which means it's called on the User struct directly rather than a single instance of the struct
 
*/

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String

    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ConformanceNotes: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()

    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ConformanceNotes()
}
