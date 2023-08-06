//
//  ContentView.swift
//  TestScrollBar
//
//  Created by Lore P on 06/08/2023.
//

import SwiftUI
import AlphabetScrollBar

struct ContentView: View {
  var body: some View {
    AlphabetScrollView(collectionDisplayMode: CollectionDisplayMode.asList, collection:  Country.all, sectionHeaderFont: .caption2.bold(), sectionHeaderForegroundColor: .secondary, resultAnchor: .top) { country in
      Text(country.name)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


