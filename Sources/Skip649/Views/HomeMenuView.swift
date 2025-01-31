                ScrollView(.horizontal) {
                    LazyHStack() {
                        ForEach(sortedCategories, id: \.id) { category in
                            NavigationLink {
                                PostListView()
                            } label: {
                                VStack {
                                    //#if !SKIP
                                    Image(systemName: categoryIcon(for: category.id))
                                    
                                    //                                    #else
                                    //                                        Image(systemName: droidIcon(for: category.id))
                                    //
                                    //#endif
                                    Text(category.name)
                                        .font(.caption)
                                }
                                .font(.largeTitle)
                            }
                        }
                    }
                    .frame(height: 80)
                }
