//
//  LessonView.swift
//  Synthesize It!
//
//  Created by Henry on 4/14/20.
//

import Foundation
import SwiftUI

struct LessonView : View{
    @State private var index : Int?
    var wordBank: [String]
    var definitions: [String] = []
    var pictures: [Image] = []
    
    var body : some View{
    
        NavigationView{
            ZStack{
                Color(red: 80/255, green: 204/255, blue: 189/255)
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("Words you need to know")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Spacer()
                
                    GeometryReader{ g in
                        VStack(spacing: 40){
                            Button(self.getWords()){
                                
                            }
                            .frame(maxWidth: g.size.width/1.5)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20))
                            .lineSpacing(20)
                            .lineLimit(3)
    
                            if(self.index == nil){
                                Text("What is \(self.wordBank[0])")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                
                                Text("\(self.definitions[0])")
                                
                                self.pictures[0].resizable()
                                .frame(width:200, height: 200)
                            }
                            Spacer()
                        }
                    }
                    
                    
                }
            }
            .navigationBarTitle("Transcription")
            .navigationBarItems(trailing:
                Button("Let's try it!"){
                    
                }.padding())
        }
        
            
    }
    func getWords() -> String{
        var result = ""
        for x in self.wordBank{
            result += x + " \t\t"
        }
        return result
    }
}



struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(wordBank: ["DNA", "mRNA", "Introns", "Exons"],definitions: ["its the code", "", "", ""],pictures: [Image("CookBook")])
    }
}
