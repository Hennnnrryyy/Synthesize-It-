//
//  ContentView.swift
//  Synthesize It!
//
//  Created by Henry on 4/2/20.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewRouter: ViewRouter
    
    struct HomeButton: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(width: 150, height: 10, alignment: .center)
                .padding()
                .accentColor(.black)
                .background(Color(red: 191/255, green: 76/255, blue: 88/255))
                .cornerRadius(25)
        }
    }
    
    var body: some View {
        ZStack{
            Color(red: 80/255, green: 204/255, blue: 189/255)
            .edgesIgnoringSafeArea(.all)
            //LinearGradient(gradient: Gradient(colors: [.pink, .red]), startPoint: .top, endPoint: .center)
            //.edgesIgnoringSafeArea(.all)
        
            VStack (alignment: .center, spacing: 30){
                Text("Synthesize it!")
                .kerning(10)
                    .font(.largeTitle)
                    .italic()
                
                
                Spacer()
            }
            VStack(alignment: .center, spacing: 75){
                Divider()
                Button("About!"){
                    
                }
                .modifier(HomeButton())
                
                
                                
                Button("Transcription"){
                    self.viewRouter.currentPage = "page2"
                }
                .modifier(HomeButton())
                
                Button("Translation"){
                    
                }
                .modifier(HomeButton())
                
                Image("CookBook").resizable()
                    .frame(width:200, height: 200)
                
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

struct AppHome: View {

    var body: some View {
        VStack {
        Text("Hello freaky world!")
        Text("You are signed in.")
        }
    }
}
