//
//  PersonRequest.swift
//  SimpleJsonClient
//
//  Created by Tanin on 15/02/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import Foundation

enum PersonRequestResult {
  case success(Person)
  case failure
}

struct PersonRequest {
  let resource: URL
  
  init() {
    let resourceString = "http://localhost:8080/api/data/"
    guard let resourceURL = URL(string: resourceString) else {
      fatalError()
    }
    self.resource = resourceURL
  }
  
  func getPerson(completion: @escaping (PersonRequestResult) -> Void) {
    
    let dataTask = URLSession.shared
      .dataTask(with: resource) { data, _, _ in
        
        guard let jsonData = data else {
          completion(.failure)
          return
        }
        
        do {
          // parse json to the Person model
          let persontData = try JSONDecoder()
            .decode(Person.self, from: jsonData)
          
          completion(.success(persontData))
          
        } catch {
          
          completion(.failure)
          
        }
        
    }
    
    dataTask.resume()
    
  }
  
}
