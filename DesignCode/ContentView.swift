//
//  ContentView.swift
//  DesignCode
//
//  Created by Zarina Bekova on 9/2/21.
//

import SwiftUI

struct CountryData: Identifiable {
    var id = UUID()
    
    let title: String
    let imageName: String
    let imageDescription: String
    
}

struct ContentView: View {
    
    var items = [CountryData]()
    
    var body: some View {
        NavigationView {
            List(items) { data in
                NavigationLink(destination: DataView(dataSource: data)) {
                    HStack {
                        Image(data.imageName)
                            .resizable().frame(width:  100, height: 100, alignment: .center)
                            .cornerRadius(10)
                        
                        Text(data.title)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationBarTitle("Countries")
        }
    }
}


struct DataView: View {
    
    var dataSource: CountryData
    
    var body: some View {
        VStack {
            Image(dataSource.imageName)
                .resizable().frame(width: 300, height: 300, alignment: .center)
                .aspectRatio(contentMode: .fit)
            Text(dataSource.imageDescription)
        }
        .navigationBarTitle(dataSource.title)
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: [
            CountryData(title: "France", imageName: "France", imageDescription: "The Eiffel Tower at sunrise. It's a powerful and distinctive symbol of the city of Paris, and by extension, of France."),
            CountryData(title: "Germany", imageName: "Germany", imageDescription: "This is Cologne, the largest city of Germany."),
            CountryData(title: "Greece", imageName: "Greece", imageDescription: "This is Sintorini. Santorini in Greece is a part of Cyclades islands complex. The island was created after a huge eruption of a volcano. Santorini is the most popular Greek destination and a worldwide famous island."),
            CountryData(title: "Italy", imageName: "Italy", imageDescription: "Vatican City is an independent city state located in the heart of Rome, ruled by the Pope (Bishop of Rome). The Vatican is the smallest state in Europe. It has a total area of 0,44 km² and inside its wall live approximately 1000 people."),
            CountryData(title: "Sweden", imageName: "Sweden", imageDescription: "This is Sweden"),
            CountryData(title: "UK", imageName: "UK", imageDescription: "This is UK")
        ])
    }
}
