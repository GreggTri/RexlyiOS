//
//  AutheticationError.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/10/23.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}
