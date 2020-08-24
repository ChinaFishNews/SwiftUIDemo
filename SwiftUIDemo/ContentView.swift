//
//  ContentView.swift
//  Rooms
//
//  Created by xinwen on 2020/8/16.
//  Copyright © 2020 baidu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    var rooms:[Room] = []
    
    @ObservedObject var store = RoomStore(rooms: [])
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    Button(action: addRooms) {
                        Text("Add Rooms")
                    }
                }
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                
                
            }
            .navigationBarTitle("Rooms")
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
            
            
        }
    }
    
    
    func addRooms() {
        store.rooms.append(Room(name: "Hall 2", capacity: 100))
    }
    
    func delete(at offsets : IndexSet) {
        store.rooms.remove(atOffsets:offsets)
    }
    
    func move(from surce:IndexSet, to dest:Int) {
        store.rooms.move(fromOffsets: surce, toOffset: dest)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store:RoomStore(rooms: testData))
            ContentView(store:RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store:RoomStore(rooms: testData))
            .environment(\.colorScheme, .dark)
            ContentView(store:RoomStore(rooms: testData))
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}

struct RoomCell: View {
    let room:Room
    
    var body: some View {
        NavigationLink(destination:RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(room.name)
                    .font(.subheadline)
//                    .foregroundColor(.black)
                Text("\(room.capacity) people")
                    .foregroundColor(.secondary)
            }
        }
    }
}
