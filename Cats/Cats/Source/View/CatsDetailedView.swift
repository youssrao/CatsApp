//
//  CatsDetailedView.swift
//  Cats
//
//  Created by Youssra Outelli on 13/11/2022.
//

import SwiftUI

struct CatsDetailedView: View {

  @StateObject var catsViewModel = CatsViewModel()

  var cat: Cats
  
  var body: some View {
    List {
      Section(header: Text("Picture"), content: {
        HStack {
          Spacer()
          AsyncImage(url: cat.image.url) { image in
            image
              .resizable()
              .aspectRatio(1/1, contentMode: .fit)
              .frame(width: 150, height: 150, alignment: .center)
              .clipShape(RoundedRectangle(cornerRadius: 52.0), style: FillStyle())
              .cornerRadius(10.0)
          } placeholder: {
            ProgressView()
          }
          Spacer()
        }
      })

      Section(header: Text("Info"), content: {
        Group {
          CatsInfoRow(title: "name", value: cat.name)
          CatsInfoRow(title: "description", value: cat.description)
          CatsInfoRow(title: "weight imperial", value: cat.weight.imperial)
          CatsInfoRow(title: "weight metric", value: cat.weight.metric)
        }

        Group {
          CatsInfoRow(title: "temperament", value: cat.temperament)
          CatsInfoRow(title: "life span", value: cat.lifeSpan.codingKey.stringValue)
          CatsInfoRow(title: "indoor", value: cat.indoor.codingKey.stringValue)
          CatsInfoRow(title: "alt names", value: cat.altNames)
          CatsInfoRow(title: "adaptability", value: cat.adaptability.codingKey.stringValue)
          CatsInfoRow(title: "dog friendly", value: cat.dogFriendly.codingKey.stringValue)
          CatsInfoRow(title: "energy level", value: cat.energyLevel.codingKey.stringValue)
          CatsInfoRow(title: "affection level", value: cat.affectionLevel.codingKey.stringValue)

        }


      })
    }
    .refreshable {
      catsViewModel.getCats()
    }
    .listStyle(.grouped)
    .navigationTitle(cat.name)
  }
}

struct CatsInfoRow: View {

  var title: String
  var value: String

  var body: some View {

    HStack{
            Text(title)
        .font(.body)
        .foregroundColor(.accentColor)
      Spacer()
      Text(value)
    }
  }
}
