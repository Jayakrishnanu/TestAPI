//
//  APIService.swift
//  GitProject
//
//  Created by Jayakrishnan u on 3/26/21.
//

import Foundation

class APIService {
    func getResponse<T: Codable>(url: String, classType: T.Type, completionHandler: @escaping([T]) -> Void) {
        guard let url = URL(string: url) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error getting data \(error.localizedDescription)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {  return }
            
            if let data = data {
                let response = String(data: data, encoding: .utf8)
                let decoder = JSONDecoder()
                let otherResponse = try? decoder.decode([T].self, from: data)
                completionHandler(otherResponse ?? [])
                // print(response)
            }
            
        }
        dataTask.resume()
      
    }
}
