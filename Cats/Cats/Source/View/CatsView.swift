//
//  CatsView.swift
//  Cats
//
//  Created by Youssra Outelli on 13/11/2022.
//

import SwiftUI
import Combine
import Foundation

struct CatsView: View {

  @StateObject var catsViewModel = CatsViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(catsViewModel.cats) { cat in
          HStack {
            AsyncImage(url: cat.image.url) { image in
              image
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .frame(width: 100, height: 110)
                .cornerRadius(10.0)
            } placeholder: {
              ProgressView()
            }
            VStack(alignment: .leading) {
              Text(cat.name)
                .background(.white)
            }
          }
          NavigationLink(destination: CatsDetailedView(catsViewModel: catsViewModel, cat: cat)) {
                             Text("Show Detail View")
                         }
        }
      }
      .listStyle(.plain)
      .refreshable {
        catsViewModel.getCats()
      }
    }
    .environmentObject(catsViewModel)
  }
}
