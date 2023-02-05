//
//  ContentView.swift
//  Memorize
//
//  Created by Peter Clarke on 02.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel : EmojiMemoryGame
    @State var emojisCount = 4
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(viewModel.cards, id : \.self){ emoji in
                        CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                        
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            
        }
    }
    
}




struct CardView : View{
    
    
    
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
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
