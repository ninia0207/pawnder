//
//  ContentView.swift
//  SwipeTest
//


import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    private var pets: [String] = ["Bob", "Doggie", "Kitty", "Bubu", "Daisy"].reversed()
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(pets, id: \.self) { pet in
                    CardView(pet: pet)
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
