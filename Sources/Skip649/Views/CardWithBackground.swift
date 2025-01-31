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
            VStack {
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
                        .font(.title)
                    Spacer()
                    Text(description ?? "")
                }
            }
            .padding(.all)
          //  .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0), Color.black.opacity(0), Color.black.opacity(description != nil ? 0.3 : 0)]), startPoint: .top, endPoint: .bottom))
         //   .frame(maxWidth: .infinity)
            .frame(height: height)
            .foregroundColor(Color.white)
            .background(
                Image("placeholderImage")
                    .resizable()
                  //  .renderingMode(.original)
            )
        }
    }
}

#Preview {
    CardWithBackground(
        title: "Title",
        subTitle: "SubTitle",
        height: 300.0,
        pictureUrl:URL(fileURLWithPath:"https://hushrealty.ca/concierge/wp-content/uploads/2025/01/20241011_Beaches-Turks-and-Caicos_TChieffi_125.jpg.jpg"),
        description: "60 minutes"
    )
}
