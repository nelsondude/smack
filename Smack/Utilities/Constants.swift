//
//  Constants.swift
//  Smack
//
//  Created by Alexander Nelson on 11/8/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants

let BASE_URL = "https://ios11-chat-app.herokuapp.com/v1/"
let URL_REGISTER = BASE_URL + "account/register"

// Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// Auth/Defaults
let LOGGED_IN_KEY = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"
