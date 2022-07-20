//
//  Breed.swift
//  TheCatShow
//
//  Created by Nasim Ahmed on 20.07.22.
//

import Foundation


struct Breed: Codable, CustomStringConvertible, Identifiable{
    let id: String
    let name: String
    let temperament: String
    let description: String
    let energy_Level: Int
    let image: BreedImage?
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case temperament
        case description
        case energy_level = "energyLevel"
        case image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        description = try values.decode(String.self, forKey: .description)
        energy_Level = try values.decode(Int.self, forKey: .energy_level)
        image = try values.decode(BreedImage.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
    }
}


