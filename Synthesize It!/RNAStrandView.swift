//
//  RNAStrandView.swift
//  Synthesize It!
//
//  Created by Henry on 4/16/20.
//

import Foundation
import SwiftUI

struct RNAStrandView : View{
    var amminoAcids : [String]
    
    var body: some View{
        VStack(spacing: 0){
            HStack(spacing: 15){
                ForEach(0..<fourOrLess(), id: \.self) { x in
                    ZStack{
                        RNABasePair(base: self.amminoAcids[self.amminoAcids.count-1])
                            .offset(x: 0.0, y: 0.0)
                    }
                }
            }
            Rectangle()
                .frame(width: 100.0, height: 10.0)
        }.frame(maxHeight: 80, alignment: .bottom)
    }
    
    func fourOrLess() -> Int{
        return self.amminoAcids.count < 1 ? self.amminoAcids.count : 1
    }
    
    mutating func addAcid(acid: String){
        self.amminoAcids.append(acid)
    }
    
    mutating func popAcid(){
           self.amminoAcids.remove(at: 0)
           
       }
}


struct RNAStrandView_Previews: PreviewProvider {
    static var previews: some View {
        RNAStrandView(amminoAcids: [])
    }
}
