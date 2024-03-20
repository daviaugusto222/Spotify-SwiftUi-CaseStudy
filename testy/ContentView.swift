//
//  ContentView.swift
//  testy
//
//  Created by user on 13/03/24.
//

import SwiftUI

struct Album: Hashable {
    var name: String
    var image: String = "heron"
}

struct ContentView: View {
    
    private var data = [
        Album(name:"Upbeat Mix"),
        Album(name:"The boy and the Heron - Orinal Soundtrack"),
        Album(name:"(fo)focando"),
        Album(name:"SEVENTEEN TUOR 'FOLLOW'"),
        Album(name:"lofi garden"),
        Album(name:"NewJeans 2nd EP 'Get Up'"),
        Album(name:"K-Club Party"),
        Album(name:"SEVENTEEN 11th Mini Album")]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical, showsIndicators: false){
                    
                    
                    
                    Spacer()
                        .frame(height: 20)
                    
                    CardAlbum(data: data)
                        .padding(.horizontal)
                    
                    TitleSection(title: "Jump back in")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 12){
                            ForEach(data, id: \.self) { item in
                                LargeCard(album: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    TitleSection(title: "More of what you like")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 12){
                            ForEach(data, id: \.self) { item in
                                LargeCard(album: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    TitleSection(title: "K-pop")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 12){
                            ForEach(data, id: \.self) { item in
                                LargeCard(album: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    TitleSection(title: "Recommended for today")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 12){
                            ForEach(data, id: \.self) { item in
                                LargeCard(album: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    TitleSection(title: "Study mode")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 12){
                            ForEach(data, id: \.self) { item in
                                LargeCard(album: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    
                }
                .clipped()
                .background(Color("Sbackground"))
                
                VStack {
                    Spacer()
                    HStack(alignment: .center) {
                        Image("heron")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .padding(7)
                            .shadow(color: .black.opacity(0.4) ,radius: 4)
                        VStack(alignment: .leading, spacing: 0){
                            Text("The boy and the Heron - Orinal Soundtrack")
                                .font(.system(size: 18, weight: .regular))
                                .padding(.vertical,1)
                                .lineLimit(1)
                            Text("Description")
                                .font(.system(size: 16, weight: .regular))
                                .padding(.vertical,1)
                                .lineLimit(1)
                                .opacity(0.7)
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "airpodsmax")
                                .font(.title2)
                        }
                        .shadow(color: .blue ,radius: 10, x: -20)
                        Button(action: {}) {
                            Image(systemName: "play.fill")
                                .font(.title2)
                        }
                        .padding()
                        
                    }
                    .frame(width: 375, height: 60, alignment: .leading)
                    .background(.sblue)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .shadow(color: .black ,radius: 20, y: -4)
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

struct CardAlbum: View {
    var data: [Album]
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 7, pinnedViews: [.sectionHeaders]){
            Section {
                ForEach(data, id: \.self) { item in
                    HStack {
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                        Spacer()
                            .frame(width: 8)
                        Text(item.name)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .lineLimit(2)
                    }
                    .frame(width: 175, height: 55, alignment: .leading)
                    .background(Color("Sgray"))
                    .cornerRadius(6)
                }
            } header: {
                MenuFilter()
            }
        }
        
    }
}

struct MenuFilter: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("heron")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            })
            Group {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("All")
                })
                .foregroundColor(.black)
                .tint(Color("Sgreen"))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Music")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Podcasts")
                })
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .foregroundColor(.white)
            .tint(Color("Sgray"))
            Spacer()
        }
        .font(.system(size: 13, weight: .medium))
        .frame(height: 35)
        .padding(.top, 5)
        .padding(.bottom, 7)
        .background(Color("Sbackground"))
    }
}

struct LargeCard: View {
    var album: Album
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Image(album.image)
                .resizable()
                .scaledToFit()
            Text(album.name)
                .font(.system(size: 13, weight: .semibold))
                .padding(.vertical,1)
                .lineLimit(1)
            Text(album.name.description)
                .font(.system(size: 13))
                .foregroundStyle(.gray)
                .lineLimit(2)
        }
        .frame(width: 140)
        
    }
}

struct TitleSection: View {
    var title: String = "Title"
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 15)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
