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
    let energyLevel: Int
    let breedDescription: String
    let image: BreedImage?
    
    var description: String{
        return "Cat with name: \(name), temperament: \(temperament), energyLevel: \(energyLevel), breedDescription: \(breedDescription)"
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case temperament
        case energyLevel = "energy_level"
        case breedDescription = "description"
        case image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        breedDescription = try values.decode(String.self, forKey: .breedDescription)
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
    }
    init(id: String, name: String, temperament: String, energyLevel: Int, breedDescription: String, image: BreedImage?) {
        self.id = id
        self.name = name
        self.temperament = temperament
        self.energyLevel = energyLevel
        self.breedDescription = breedDescription
        self.image = image
    }
    
    
    static func example1() -> Breed{
        return Breed(id: "abyss", name: "Abyssinian", temperament: "Active, Energetic, Independent, Intelligent, Gentle", energyLevel: 5, breedDescription: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", image: BreedImage(id: "i", width: 100, height: 100, url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg"))
    }
    
    static func example2() -> Breed{
        return Breed(id: "cypr", name: "Cyprus", temperament: "Affectionate, Socia", energyLevel: 4, breedDescription: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.", image: BreedImage(id: "i", width: 100, height: 100, url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg"))
    }
    
}


