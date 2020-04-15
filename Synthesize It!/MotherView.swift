//
//  MotherView.swift
//  Synthesize It!
//
//  Created by Henry on 4/14/20.
//

import Foundation
import SwiftUI

struct MotherView : View {
    @ObservedObject var viewRouter: ViewRouter

    var body: some View {
         VStack {
            if viewRouter.currentPage == "page1" {
                ContentView(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "page2" {
                LessonView(wordBank: ["DNA", "mRNA", "Introns", "Exons"],definitions: ["its the code", "", "", ""],pictures: [Image("CookBook")])
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}

