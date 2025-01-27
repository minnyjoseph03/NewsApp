//
//  Article.swift
//  NewsApp
//
//  Created by Apple on 27/01/25.
//

import Foundation

struct Article: Identifiable, Decodable {
    let id: String
    let title: String
    let author: String?
    let description: String?
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "url"
        case title
        case author
        case description
        case imageUrl = "urlToImage"
    }
}

struct NewsResponse: Decodable {
    let articles: [Article]
}
