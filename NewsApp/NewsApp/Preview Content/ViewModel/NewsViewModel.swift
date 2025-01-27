//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Apple on 27/01/25.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []

    private let apiKey = "d8757841d4044dca9e756b1b081dd3a4"

    func fetchNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(NewsResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.articles = response.articles
                    }
                }
            }
        }.resume()
    }
}
