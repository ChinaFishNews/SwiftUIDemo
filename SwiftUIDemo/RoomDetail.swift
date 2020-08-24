//
//  RoomDetail.swift
//  Rooms
//
//  Created by xinwen on 2020/8/17.
//  Copyright © 2020 baidu. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    
    let room:Room
    @State var zoomed = false
    
    var body: some View {
        
            ZStack(alignment: .topLeading) {
                Image(room.imageName)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    .navigationBarTitle(Text(room.name), displayMode: .inline)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            self.zoomed.toggle()
                        }
                    }
                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
                
                if room.hasVideo && !zoomed {
                    Image(systemName: "video.fill")
                        .font(.largeTitle)
                        .padding(.all)
                        .transition(.move(edge: .leading))
                }
            }
        
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
        Group {
            RoomDetail(room: testData[0])
            RoomDetail(room: testData[1])
        }
        
//        }
    }
}
