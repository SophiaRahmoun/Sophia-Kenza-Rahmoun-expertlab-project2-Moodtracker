//
//  QuoteViewModel.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quote: Quote?

    private let apiKey = "XKQVJZwltQxukg/rZw+6dw==fm3v5KfMWz4GNOGl"
    private let urlString = "https://api.api-ninjas.com/v2/quotes?category=success,wisdom"

    func fetchQuote() {
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([Quote].self, from: data)
                    DispatchQueue.main.async {
                        self.quote = result.first
                    }
                } catch {
                    print("Failed to decode quote: \(error)")
                }
            }
        }.resume()
    }
}
