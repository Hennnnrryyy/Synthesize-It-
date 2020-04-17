//
//  AboutView.swift
//  Synthesize It!
//
//  Created by Henry on 4/17/20.
//

import Foundation
import SwiftUI


struct AboutView: View{
     @ObservedObject var viewRouter: ViewRouter
    
    var body: some View{
        NavigationView{
            ZStack{
                Color(red: 80/255, green: 204/255, blue: 189/255)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20){
                    Text("What is Synthesize It?").frame(maxWidth: .infinity, alignment:  .leading)
                        .padding()
                    Text("Synthesize It is an app created by Henry Smith in an effort to help provide a more interactive approach to learning the process of making proteins. Here is some background information on protein synthesis:")
                        .kerning(2)
                        .font(.callout)
                        .lineSpacing(7)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }.navigationBarTitle("About")
            .navigationBarItems(leading:
                Button("🏠"){
                    self.viewRouter.currentPage = "home"
            })
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(viewRouter: ViewRouter())
    }
}
