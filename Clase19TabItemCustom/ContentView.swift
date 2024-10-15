//
//  ContentView.swift
//  Clase19TabItemCustom
//
//  Created by Escurra Colquis on 14/10/24.
//

import SwiftUI

enum ScreenTabView: Int, CaseIterable {
    case home
    case list
    case favourite
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Inicio"
        case .list:
            return "Lista"
        case .favourite:
            return "Favoritos"
        case .profile:
            return "Mi Perfil"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .list:
            return "list.star"
        case .favourite:
            return "heart"
        case .profile:
            return "person"
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Vista Inicio")
            .bold()
            .font(.system(size: 50))
            .foregroundStyle(.pink.opacity(0.7))
    }
}

struct ListScreenview: View {
    var body: some View {
        Text("Vista Lista")
            .bold()
            .font(.system(size: 50))
            .foregroundStyle(.pink.opacity(0.7))
    }
}

struct FavouriteView: View {
    var body: some View {
        Text("Vista Favoritos")
            .bold()
            .font(.system(size: 50))
            .foregroundStyle(.pink.opacity(0.7))
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Mi Perfil")
            .bold()
            .font(.system(size: 50))
            .foregroundStyle(.pink.opacity(0.7))
    }
}

struct ContentView: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
            ListScreenview()
                .tag(1)
            FavouriteView()
                .tag(2)
            ProfileView()
                .tag(3)
        }
        ZStack {
            HStack {
                ForEach((ScreenTabView.allCases), id: \.self) {
                    item in
                    Button {
                        withAnimation(.spring(duration:  2.7)) {
                            selectedTab = item.rawValue
                        }
                    } label: {
                        CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                    }
                }
            }
            .padding(6)
        }
        .frame(height: 70)
        .background(.pink.opacity(0.2))
        .clipShape(.rect(cornerRadius: 35))
        .padding(.horizontal, 26)
    }
}

struct CustomTabItem: View {
    var imageName: String
    var title: String
    var isActive: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(isActive ? .white : .gray)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .font(.system(size: 18))
                    .foregroundStyle(isActive ? .white : .gray)
            }
            Spacer()
        }
        .animation(.bouncy(duration: 2.5), value: isActive)
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .pink.opacity(0.4) : .clear)
        .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    ContentView()
}
