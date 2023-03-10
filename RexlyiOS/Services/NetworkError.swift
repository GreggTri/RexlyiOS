//
//  NetworkError.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/10/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case invalidCredentials
    case BadRequest
    case InteralServerError
    case custom(errorMessage: String)
}
