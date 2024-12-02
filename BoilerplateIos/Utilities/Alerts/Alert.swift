//
//  Alert.swift
//  appetizers
//
//  Created by outcode  on 11/12/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let  id = UUID()
    let  tittle: Text
    let  message: Text
    let  dismissButton: Alert.Button
    
}

struct AlertContext{
    
    static let invalidData       = AlertItem(tittle: Text("Server Error"),
                                       message: Text("The Data Received from the server was invalid"),
                                       dismissButton: .default(Text("OK")))
    static let invalidResponse   = AlertItem(tittle: Text("Server Error"),
                                           message: Text("Invalid response from the server"),
                                           dismissButton: .default(Text("OK")))
    static let invalidURL        = AlertItem(tittle: Text("Server Error"),
                                      message: Text("There was an issue connecting to the server"),
                                      dismissButton: .default(Text("OK")))
    static let unabaleToComplete = AlertItem(tittle: Text("Server Error"),
                                             message:Text("Unable to complete your reuquest at this time. "),
                                             dismissButton: .default(Text("OK")))
    
    static let inValidForm = AlertItem(tittle: Text("Invalid Form"),
                                             message:Text("Please enter all the fields in the from have been filled out."),
                                             dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(tittle: Text("Invalid Email"),
                                             message:Text("Please ensure your email is correct."),
                                             dismissButton: .default(Text("OK")))
    
    static let userSaveSucess = AlertItem(tittle: Text("Profile Saved"),
                                             message:Text("Your profile is saved sucessfully"),
                                             dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(tittle: Text("Profile Error"),
                                             message:Text("There was an error retrieving your profile"),
                                             dismissButton: .default(Text("OK")))


}
