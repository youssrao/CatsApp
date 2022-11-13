//
//  Request.swift
//  Cats
//
//  Created by Youssra Outelli on 13/11/2022.
//

import Foundation
import Combine

class Request: ObservableObject {

  @Published var cats = [Cats]()
  let decoder = JSONDecoder()
  let session = URLSession(configuration: .default)

  func fetch<T: Codable>(from url: URL, with apiKey: String) -> AnyPublisher<T, Error> {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    var request = URLRequest(url: url)
    request.addValue(apiKey, forHTTPHeaderField: "x-api-key")

    return URLSession.shared.dataTaskPublisher(for: url)
      .receive(on: DispatchQueue.main)
      .tryMap { (data, response) -> Data in
        guard let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
          throw URLError(.badServerResponse)
        }
        return data
      }
      .decode(type: T.self, decoder: decoder)
      .eraseToAnyPublisher()
  }
}
