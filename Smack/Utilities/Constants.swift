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
let URL_LOGIN = BASE_URL + "account/login"
let URL_USER_ADD = BASE_URL + "user/add"

// Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// Auth/Defaults
let LOGGED_IN_KEY = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"

// Headers
let HEADER = [
    "Content-Type": "Application/json; charset=utf-8"
]
