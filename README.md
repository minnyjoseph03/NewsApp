NewsApp

Overview

NewsApp is a SwiftUI application that displays the latest top headlines from the United States. Users can browse articles, view details, and see the number of likes and comments for each news item.

Features

* News List View: Displays a list of top headlines with article titles, authors, and thumbnails.
* Detail View: Shows detailed content of the selected article along with additional metadata (likes and comments).
* Image Placeholder: If an article has no image, a default placeholder is shown.
* Extensible Design: The app is designed to accommodate future features like offline reading or bookmarking.

Prerequisites

* Xcode 13 or later
* iOS 15 or later
* A valid API key for NewsAPI

Installation

1. Clone the repository: git clone https://github.com/minnyjoseph03/NewsApp.git
2. cd NewsApp
3. Obtain an API key from NewsAPI.
4. Replace YOUR_NEWS_API_KEY in NewsViewModel with your API key: private let apiKey = "YOUR_NEWS_API_KEY"
5. Run the application on a simulator or device. 
API Usage

 News API

* Fetches the latest US headlines using the endpoint: https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY

Additional Metadata 

* Number of likes: https://cn-news-info-api.herokuapp.com/likes/<ARTICLEID>
* Number of comments: https://cn-news-info-api.herokuapp.com/comments/<ARTICLEID>

Replace <ARTICLEID> with the formatted article URL as described in the task brief.

Testing

* Ensure the API key is valid before running the app.
* Unit tests can be added to validate the fetching logic and model parsing.
  
Future Enhancements

* Offline reading support.
* Bookmarking functionality.
* Audio playback for article content.
  
Acknowledgments

* NewsAPI for providing the news data.

