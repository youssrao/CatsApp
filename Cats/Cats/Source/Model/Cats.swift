//
//  Cats.swift
//  Cats
//
//  Created by Youssra Outelli on 13/11/2022.
//

import Foundation


struct Cats: Codable, Identifiable {

  let id: String
  let name: String
  let temperament: String
  let description: String
  let lifeSpan: String
  let indoor: Int
  let altNames: String

  let adaptability: Int
  let affectionLevel: Int
  let dogFriendly: Int
  let energyLevel: Int
  let weight: CatWeight
  let image: CatImage




}

struct CatImage: Codable, Identifiable {

  let id: String
  let width: CGFloat
  let height: CGFloat
  let url: URL
}

struct CatWeight: Codable {

  let imperial: String
  let metric: String

}
