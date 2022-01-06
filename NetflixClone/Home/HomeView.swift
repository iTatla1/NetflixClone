//
//  HomeView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    let screen = UIScreen.main.bounds
    @State private var movieDetailsToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenere: HomeGenere = .AllGenere
    
    @State private var showGenereSelection: Bool = false
    @State private var showTopRowSelection: Bool = false
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                
                // Main VStack
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenere: $homeGenere, showMenu: $showTopRowSelection, showGenere: $showGenereSelection)
                    
                    TopMoviePreview(movie: exampleMovie4, movieDetailsToShow: $movieDetailsToShow)
                        .frame(width: screen.size.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    HomeStack(movieDetailsToShow: $movieDetailsToShow, typeRowSelection: topRowSelection, genere: homeGenere, vm: vm)
                }
            }
            
            if (movieDetailsToShow != nil) {
                MovieDetails(movie: movieDetailsToShow!, movieDetailsToShow: $movieDetailsToShow )
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack(spacing: 40){
                        Spacer()
                        ForEach(HomeTopRow.allCases, id: \.self) {topRow in
                            Button {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            } label: {
                                if topRow == topRowSelection {
                                    Text(topRow.rawValue)
                                        .bold()
                                } else {
                                    Text(topRow.rawValue)
                                        .foregroundColor(.gray)
                                }
                            }

                        }
                        
                        Spacer()
                        
                        Button {
                            showTopRowSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 30)

                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
                    
            }
            
            if showGenereSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack{
                        Spacer()
                        
                        ScrollView {
                            VStack(spacing: 40) {
                                ForEach(vm.allGenre, id: \.self) {genere in
                                    Button {
                                        homeGenere = genere
                                        showGenereSelection = false
                                    } label: {
                                        if genere == homeGenere {
                                            Text(genere.rawValue)
                                                .bold()
                                        } else {
                                            Text(genere.rawValue)
                                                .foregroundColor(.gray)
                                        }
                                    }

                                }
                            }
                        }
                        .padding(.top, 50)
                        
                        Spacer()
                        
                        Button {
                            showGenereSelection = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 30)

                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
                    
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenere: HomeGenere
    
    @Binding var showMenu: Bool
    @Binding var showGenere: Bool
    
    var body: some View {
        
        switch topRowSelection {
        case .home:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button {
                    topRowSelection = .tvShows
                } label: {
                    Text("TV Shows")
                    
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                    
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                    
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 20)
            .padding(.trailing, 30)
            
        case .myList, .tvShows, .movies:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .buttonStyle(PlainButtonStyle())
                HStack(spacing: 20) {
                    Button {
                        showMenu = true
                    } label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button {
                        showGenere = true
                    } label: {
                        HStack {
                            Text(homeGenere.rawValue)
                                .font(.system(size: 12))

                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                    
                }
                
            }
            .padding(.leading, 20)
            .padding(.trailing, 30)
            
        }
        
        
        
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenere: String, CaseIterable {
    case AllGenere
    case Action
    case Comedy
    case Horror
    case Thriller
}

