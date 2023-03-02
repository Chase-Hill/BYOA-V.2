//
//  ChessService.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import UIKit

struct ChessService {
    
    static func fetchChessUser(searchTerm: String, completion: @escaping (Result<UserDetails, NetworkError>) -> Void) {
        
        guard let baseURL = URL(string: Constants.UserService.userBaseURL) else { completion(.failure(.invalidURL)) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(searchTerm)
        
        guard let finalURL = urlComponents?.url else { completion(.failure(.invalidURL)) ; return }
        print("User Details URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                completion(.failure(.thrownError(error))) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("User Details Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            
            do {
                
                let user = try JSONDecoder().decode(UserDetails.self, from: data)
                completion(.success(user))
            } catch {
                
                completion(.failure(.unableToDecode)) ; return
            }
        } .resume()
    }
    
    static func fetchUserStats(searchTerm: String, completion: @escaping (Result<UserStats, NetworkError>) -> Void) {
        
        guard let baseURL = URL(string: Constants.UserService.userBaseURL) else { completion(.failure(.invalidURL)) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append("Chase_hill9")
        urlComponents?.path.append(Constants.UserService.statsPath)
        
        guard let finalURL = urlComponents?.url else { completion(.failure(.invalidURL)) ; return }
        print("User Stats URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                completion(.failure(.thrownError(error))) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("User Stats Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            
            do {
                
                let user = try JSONDecoder().decode(UserStats.self, from: data)
                completion(.success(user))
            } catch {
                
                completion(.failure(.unableToDecode)) ; return
            }
        } .resume()
    }
    
    static func fetchUserImage(forUser userImagePath: String, completion: @escaping(Result<UIImage, NetworkError>) -> Void) {
        guard let imageURL = URL(string: userImagePath) else { completion(.success(UIImage(named: "Image Placeholder")!)) ; return }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                completion(.failure(.thrownError(error))) ; return
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            guard let userImage = UIImage(data: data) else { completion(.failure(.unableToDecode)) ; return }
            completion(.success(userImage))
        } .resume()
    }
}
