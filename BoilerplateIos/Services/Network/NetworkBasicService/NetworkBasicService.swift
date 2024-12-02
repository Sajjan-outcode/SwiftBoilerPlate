//
//  NetworkBasicService.swift
//  TimeEntry
//
//  Created by outcode  on 25/06/2024.
//

import Foundation
import Combine

struct NetworkBasicService {
    
    
    func addTimeValue(_ timeItems: [TimeItemInfoRequestDTO],_ url: URL ,completion: @escaping((Result<String, Error>)-> Void)) {
        
        let jsonData = try? JSONEncoder().encode(timeItems)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("\(UserDefaults.standard.string(forKey: UserDefaultKeys.ACCESS_TOKEN.rawValue) ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error.toDomainError()))
                }
                
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(DomainError.error("Invalid Reponse")))
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(DomainError.error(String(data: data!, encoding: .utf8) ?? "")))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(DomainError.error(String(data: data!, encoding: .utf8) ?? "")))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(String(data: data, encoding: .utf8) ?? "false"))
            }
        }
        task.resume()
    }
    
    
    func updateTimeValue(_ timeItems: TimeItemInfoRequestDTO,_ url: URL ,completion: @escaping((Result<String, Error>)-> Void)) {
        
        let jsonData = try? JSONEncoder().encode(timeItems)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("\(UserDefaults.standard.string(forKey: UserDefaultKeys.ACCESS_TOKEN.rawValue) ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error.toDomainError()))
                }
                
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(DomainError.error("Invalid Reponse")))
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(DomainError.error(String(data: data!, encoding: .utf8) ?? "")))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(DomainError.error(String(data: data!, encoding: .utf8) ?? "")))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(String(data: data, encoding: .utf8) ?? "false"))
            }
        }
        task.resume()
    }
}
