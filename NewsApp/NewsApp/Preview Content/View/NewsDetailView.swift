//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Apple on 27/01/25.
//

import SwiftUI

struct NewsDetailView: View {
    let article: Article
        @State private var likes: Int?
        @State private var comments: Int?

        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: article.imageUrl ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .foregroundColor(.gray)
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    Text(article.title)
                        .font(.largeTitle)

                    Text("By \(article.author ?? "Unknown Author")")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text(article.description ?? "No description available.")

                    if let likes = likes, let comments = comments {
                        HStack {
                            Text("Likes: \(likes)")
                            Spacer()
                            Text("Comments: \(comments)")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                .padding()
                .onAppear {
                    fetchLikesAndComments()
                }
            }
        }

        private func fetchLikesAndComments() {
            let articleId = article.id
            let likesUrl = "https://cn-news-info-api.herokuapp.com/likes/\(articleId)"
            let commentsUrl = "https://cn-news-info-api.herokuapp.com/comments/\(articleId)"

            URLSession.shared.dataTask(with: URL(string: likesUrl)!) { data, _, _ in
                if let data = data, let likes = try? JSONDecoder().decode(Int.self, from: data) {
                    DispatchQueue.main.async {
                        self.likes = likes
                    }
                }
            }.resume()

            URLSession.shared.dataTask(with: URL(string: commentsUrl)!) { data, _, _ in
                if let data = data, let comments = try? JSONDecoder().decode(Int.self, from: data) {
                    DispatchQueue.main.async {
                        self.comments = comments
                    }
                }
            }.resume()
        }
    }

#Preview {
    NewsDetailView(article: Article(id: "", title: "", author: "", description: "", imageUrl: ""))
}

