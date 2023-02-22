//
//  CharacterData.swift
//  
//
//  Created by Artem Kvasnetskyi on 15.12.2022.
//

import Foundation

public struct CharacterData: Decodable {
    public let gender: String
    public let name: String
    public let image: URL
    public let species: String
    public let status: String
    
    public static let placeholder = CharacterData(
        gender: "Male",
        name: "Rick Sanchez",
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
        species: "Human",
        status: "Alive"
    )
}
