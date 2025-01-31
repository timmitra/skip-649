//
//  CardWithBackground.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-11.
//

import SwiftUI

struct CardWithBackground: View {
    var title: String
    var subTitle: String?
    var height: CGFloat
    var pictureUrl: URL
    var description: String?

    var body: some View {
        Card {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        if subTitle != nil {
                            Text((subTitle!).uppercased())
                                .fontWeight(.bold)
                                .opacity(0.6)
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.title3)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(description ?? "")
                }
            }
            .padding(.all)
            #if !SKIP
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0), Color.black.opacity(0), Color.black.opacity(description != nil ? 0.3 : 0)]), startPoint: .top, endPoint: .bottom))
            #endif
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .foregroundColor(Color.white)
            .background(
                AsyncImage(url: pictureUrl) { image in
                    image
                        .resizable()
                    #if !SKIP
                        .renderingMode(.original)
                    #endif
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image("placeholderImage")
                        .resizable()
                    #if !SKIP
                        .renderingMode(.original)
                    #endif
                        .aspectRatio(contentMode: .fill)
                }
            )
        }
    }
}

#Preview {
    CardWithBackground(
        title: "Title",
        subTitle: "SubTitle",
        height: 300.0,
        pictureUrl: URL(string: "https://hushrealty.ca/concierge/wp-content/uploads/2025/01/20241011_Beaches-Turks-and-Caicos_TChieffi_125.jpg") ?? URL(fileURLWithPath: ""),
        description: "60 minutes"
    )
}
