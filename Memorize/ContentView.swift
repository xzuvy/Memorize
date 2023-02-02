//
//  ContentView.swift
//  Memorize
//
//  Created by Peter Clarke on 02.02.2023.
//

import SwiftUI

struct ContentView: View {

    var emojis = ["🚗", "🚅", "✈️", "🛥️", "🛴", "🚜", "🚔", "🏎️"]
    @State var emojisCount = 4
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(emojis[0..<emojisCount], id : \.self){ emoji in
                        CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                        
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            HStack{
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
            //.foregroundColor(.red)
        }
    }
    var add : some View{
        Button {
            if emojisCount < emojis.count{
                emojisCount += 1
            }
        } label: {
            Image(systemName: "plus.diamond")
                .padding(.horizontal)
        }
    }
    
    var remove : some View{
        Button {
            if emojisCount > 1{
                emojisCount -= 1
            }
        } label: {
            Image(systemName: "minus.diamond")
                .padding(.horizontal)
        }
    }
}




struct CardView : View{
    
    var content : String
    @State var isFaceUp : Bool = true
    
    var body: some View{
        
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
