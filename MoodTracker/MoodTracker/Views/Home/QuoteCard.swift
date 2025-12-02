
//
//  Quotecard.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI

struct QuoteCard: View {
    let quote: Quote?

    var body: some View {
        if let quote = quote {
            VStack(alignment: .leading, spacing: 8) {
                Text("💬 \"\(quote.quote)\"")
                    .font(.body)
                    .italic()

                Text("- \(quote.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}
