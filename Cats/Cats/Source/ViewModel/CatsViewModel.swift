//
//  CatsViewModel.swift
//  Cats
//
//  Created by Youssra Outelli on 13/11/2022.
//

import Foundation
import Combine

class CatsViewModel: ObservableObject {

  @Published var cats = [Cats]()
  var cancellables: AnyCancellable?
  private let url = URL(string: "https://api.thecatapi.com/v1/breeds/?page=1&limit=12")!
  private let apiKey = "live_ojanzuqGneDcp1iZQ8oVmjutjKApp73kBaWFjH6k7e4cI4DPufD1dVocIqn6UnHl"
  private let requestCats = Request()

  init() {
    getCats()
  }

  func fetchCats(from url: URL) -> AnyPublisher<[Cats], Error> {
    requestCats.fetch(from: url, with: apiKey)
  }

  func getCats() {
    cancellables = fetchCats(from: url)
      .sink { (completion) in
        print("COMPLETION: \(completion)")
      } receiveValue: { [weak self] (returnedCats) in
        self?.cats = returnedCats
      }
  }
}
