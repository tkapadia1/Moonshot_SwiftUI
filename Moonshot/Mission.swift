//
//  Mission.swift
//  Moonshot
//
//  Created by cis on 13/09/22.
//

import Foundation


struct Mission: Codable, Identifiable{

    struct CrewRole: Codable{
        let name, role : String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var formattedDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
