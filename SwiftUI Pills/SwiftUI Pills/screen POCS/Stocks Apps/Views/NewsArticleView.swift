//
//  NewsArticleView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 26/3/24.
//

import SwiftUI

struct NewsArticleView: View {
    
    let newsArticles: [ArticleViewModel]
    
    var body: some View {
        
        return VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Top News")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                    .gesture(DragGesture())
                
                Text("From... somewhere?")
                    .foregroundStyle(.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(newsArticles, id: \.title) { article in
                            HStack {
                                VStack(alignment: .leading, content: {
                                    Text(article.publication)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Text(article.title)
                                        .font(.title3)
                                    
                                })
                                Spacer()
                                AsyncImage(url: article.imageUrl,scale: 7)
                                    .fixedSize()
                                    .frame(width: 100)
                            }
                        }
                    }
                }.frame(maxWidth: .infinity)
            }
        }
            .cornerRadius(20)
    }
}

#Preview {
    NewsArticleView(newsArticles: [ArticleViewModel(article: Article(title: "Titulo", publication: "cosa de cosa", imageURL: "https://miro.medium.com/v2/resize:fit:720/format:webp/0*qx2VD2U9Ryu0gTex"))])
}
