//
//  Person.swift
//  SimpleJsonClient
//
//  Created by Tanin on 15/02/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import Foundation

final class Person: Codable {
    let name: String
    let job: String
    let skills: [String]
    
    init(name: String, job: String, skills: [String]) {
        self.name = name
        self.job = job
        self.skills = skills
    }
}
