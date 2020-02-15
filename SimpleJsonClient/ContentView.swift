//
//  ContentView.swift
//  SimpleJsonClient
//
//  Created by Tanin on 15/02/2020.
//  Copyright © 2020 landtanin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var returnedPersonName: String = ""
    @State var returnedPersonJob: String = ""
    @State var returnedPersonSkills: [String] = []
    let personRequest = PersonRequest()
    
    var body: some View {
        VStack {
            Text(returnedPersonName)
            Text(returnedPersonJob)
            List(returnedPersonSkills, id: \.self) { Text($0) }
            Button(action: onClick) { () in
                Text("Retrieve Data")
            }
        }
    }
    
    func onClick() {
        personRequest.getPerson { personResult in
            switch personResult {
            case .failure:
                self.returnedPersonName = "Person Request Failed"
            case .success(let person):
                self.returnedPersonName = person.name
                self.returnedPersonJob = person.job
                self.returnedPersonSkills = person.skills
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
