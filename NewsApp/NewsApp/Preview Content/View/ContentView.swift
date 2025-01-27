//
//  ContentView.swift
//  NewsApp
//
//  Created by Apple on 26/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()

       var body: some View {
           NavigationView {
               List(viewModel.articles) { article in
                   NavigationLink(destination: NewsDetailView(article: article)) {
                       HStack {
                           AsyncImage(url: URL(string: article.imageUrl ?? "")) { image in
                               image.resizable()
                           } placeholder: {
                               Image(systemName: "photo")
                                   .resizable()
                                   .foregroundColor(.gray)
                           }
                           .frame(width: 60, height: 60)
                           .clipShape(RoundedRectangle(cornerRadius: 8))

                           VStack(alignment: .leading) {
                               Text(article.title)
                                   .font(.headline)
                               Text(article.author ?? "Unknown Author")
                                   .font(.subheadline)
                                   .foregroundColor(.gray)
                           }
                       }
                   }
               }
               .navigationTitle("Top Headlines")
               .onAppear {
                   viewModel.fetchNews()
               }
           }
       }
   }

#Preview {
    ContentView()
}

