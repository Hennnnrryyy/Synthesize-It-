//
//  LessonView.swift
//  Synthesize It!
//
//  Created by Henry on 4/14/20.
//

import Foundation
import SwiftUI

struct LessonView : View{
    @ObservedObject var viewRouter: ViewRouter
    @State private var index : Int?
    var wordBank: [String]
    var definitions: [String] = []
    var pictures: [Image?] = []
   
    
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
                        VStack(spacing: 20){
                            HStack{
                            ForEach(0..<self.wordBank.count/2, id: \.self){x in
                                    Button(self.wordBank[x]){
                                        self.index = self.findIndex(name: self.wordBank[x])
                                                               }
                                                               .frame(maxWidth: g.size.width/1.5)
                                                               .font(.system(size: 20))
                            
                                }
                            }
                            HStack{
                            ForEach(self.wordBank.count/2..<self.wordBank.count, id: \.self){x in
                                Button(self.wordBank[x]){
                                    self.index = self.findIndex(name: self.wordBank[x])                               }
                                                .frame(maxWidth: g.size.width/1.5)
                                                .font(.system(size: 20))
                                                           }
                                                       }
                            if(self.index != nil){
                                Text("What is \(self.wordBank[self.index!])")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                
                                Text("\(self.definitions[self.index!])")
                                    .kerning(2)
                                    .font(.callout)
                                    .lineSpacing(7)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                
                                if(self.pictures[self.index!] != nil){
                                    self.pictures[self.index!]!
                                }
                            }
                            Spacer()
                            }
                        }
                    }
                    
            }
            .navigationBarTitle("Transcription")
            .navigationBarItems(
                leading: Button("🏠"){
                           self.viewRouter.currentPage = "home"
                           }.padding(),
                trailing: Button("Let's try it!"){
                    self.viewRouter.currentPage = "page3"
                }.padding())
            
        }
    }
    func findIndex(name: String) -> Int?{
        for x in 0..<wordBank.count{
            if(wordBank[x] == name){
                if(x == self.index){
                    return nil
                }
                else{
                    return x
                }
            }
        }
        return nil
    }
}



struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView( viewRouter: ViewRouter(), wordBank: ["DNA", "mRNA", "Introns", "Exons"],definitions: ["its the key to Nastassja's heart", "", "", ""],pictures: [Image("CookBook")])
    }
}
