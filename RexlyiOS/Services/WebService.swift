//
//  WebService.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 3/9/23.
//

import Foundation

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

struct createAccountRequestBody: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let success: Bool
    let token: String?
    let message: String?
}

struct ChatBody: Codable {
    let message: String
}

struct ChatResponse: Codable {
    let success: Bool
    let botMessage: String
    let products: Array<Dictionary<String, String?>>
}

class WebService {
    
    func chat(token: String, userMessage: String, completion: @escaping (Result<ChatResponse, NetworkError>) -> Void){
        guard let url = URL(string: "http://localhost:8000/v1/chat") else {
            completion(.failure(.custom(errorMessage: "URL is malformed!")))
            return
        }
        
        let body = ChatBody(message: userMessage)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.custom(errorMessage: "response error")))
                return
            }
            
            if response.statusCode == 200 {
                guard let data = data, error == nil else {
                    completion(.failure(.custom(errorMessage: "No data populated")))
                    return
                }
                guard let BotResponse = try? JSONDecoder().decode(ChatResponse.self, from: data) else {
                    completion(.failure(.decodingError))
                    return
                }
                
                completion(.success(BotResponse))
                
            } else if response.statusCode == 400 {
                completion(.failure(.BadRequest))
                return
            } else if response.statusCode == 403 {
                completion(.failure(.invalidCredentials))
                return
            } else if response.statusCode == 500 {
                completion(.failure(.InteralServerError))
                return
            }
        }.resume()
    }
    
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:8000/v1/user/signin") else {
            completion(.failure(.custom(errorMessage: "URL is malformed!")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data populated")))
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
        }.resume()
    }
    
    func createAccount(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:8000/v1/user/createaccount") else {
            completion(.failure(.custom(errorMessage: "URL is malformed!")))
            return
        }
        
        let body = createAccountRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data populated")))
                return
            }
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
        }.resume()
    }
}
