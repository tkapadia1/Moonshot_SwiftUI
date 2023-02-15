//
//  ContentView.swift
//  Moonshot
//
//  Created by cis on 12/09/22.
//

import SwiftUI

enum ViewStyle{
    case list
    case Grid
}

struct ContentView: View {
    let austronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var viewStyle: ViewStyle = .Grid
    
    var body: some View {
        NavigationView{
            
            Group{
                if viewStyle == .Grid {
                    ExtractedGridView(missions: missions, austronaut: austronaut)
                }else{
                    ExtractedListView(missions: missions, austronaut: austronaut)
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    if viewStyle == .Grid{
                        viewStyle = .list
                    }else {
                        viewStyle = .Grid
                    }
                } label: {
                    if viewStyle == .Grid{
                        Image(systemName: "rectangle.grid.1x2")
                    }else{
                        Image(systemName: "rectangle.3.offgrid.fill")
                    }
                }
                
        }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct ExtractedGridView: View {
    let missions: [Mission]
    let austronaut: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions){ mission in
                    NavigationLink{
                        MissionView(mission: mission, astronauts: austronaut)
                    }label: {
                        VStack{
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground))
                    }
                }
            }
            .padding([.horizontal,.bottom])
        }
    }
}

struct ExtractedListView: View {
    let missions: [Mission]
    let austronaut: [String: Astronaut]
    
    var body: some View {
        List{
            ForEach(missions){ mission in
                NavigationLink{
                    MissionView(mission: mission, astronauts: austronaut)
                }label: {
                    VStack{
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        VStack{
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground))
                }
            }
        }
 
        
    }
}
