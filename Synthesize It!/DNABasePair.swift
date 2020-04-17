//
//  DNABasePair.swift
//  Synthesize It!
//
//  Created by Henry on 4/15/20.
//

import Foundation
import SwiftUI

struct DNABasePair : View{
    var base : String
    
    var body : some View{
        ZStack{
            GeometryReader{ g in
                Path { path in
                        let w = Double(g.size.width/2)
                        let h = 33.3
                        path.move(to: CGPoint(x: w-12.5, y: h-33.3))
                        path.addLine(to: CGPoint(x: w-12.5, y: h+33.3))
                        path.addLine(to: CGPoint(x:w, y: h))
                        path.addLine(to: CGPoint(x:w+12.5, y: h+33.3))
                        path.addLine(to: CGPoint(x:w+12.5, y: h-33.3))
                    
                    //path.addLine(to: CGPoint(x: 300, y: 300))
                    //path.addLine(to: CGPoint(x: 200, y: 100))
                }.fill(self.getColor())
                    
                
            }.frame(width: 25, height: 66.7)
            
            Text(self.base)
                .foregroundColor(.black)
            .bold()
            .font(.system (size: 25))
                .offset(x: 0.0, y: -20)
          
           // Text("\(base)")
        //        .foregroundColor(.black)
               // .font(.system (size: 30))
        }
        
    }
    
    func getColor() -> Color{
        switch (self.base){
        case "A":
            return Color(red: 219 / 255, green: 54 / 255, blue: 164 / 255)
        case "T":
            return Color(red: 247 / 255, green: 220 / 255, blue: 0 / 255)
        case "C":
            return Color(red: 245 / 255, green: 98 / 255, blue: 23 / 255)
        case "G":
            return Color(red: 11 / 255, green: 72 / 255, blue: 107 / 255)
        default:
            return .pink
        }
    }
}


struct DNABasePair_Previews: PreviewProvider {
    static var previews: some View {
        DNABasePair(base: "A")
    }
}
