//
//  DNAStrandView.swift
//  Synthesize It!
//
//  Created by Henry on 4/16/20.
//

import Foundation
import SwiftUI

struct DNAStrandView : View{
    var amminoAcids : [String]
    
    var body: some View{
        VStack(spacing: 0){
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20.0)
            HStack(spacing: 15){
                ForEach(0..<fourOrLess(), id: \.self) { x in
                    ZStack{
                        DNABasePair(base: self.amminoAcids[x])
                            .offset(x: 36.5, y: 0.0)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    func fourOrLess() -> Int{
        return self.amminoAcids.count < 9 ? self.amminoAcids.count : 9
    }
    
    mutating func popAcid(){
        self.amminoAcids.remove(at: 0)
        
    }
    
    func getCurrentDNABase() -> String{
        if(self.amminoAcids.isEmpty){
            return "Empty"
        }
        return self.amminoAcids[0]
    }
}


struct DNAStrandView_Previews: PreviewProvider {
    static var previews: some View {
        DNAStrandView(amminoAcids: ["A", "A", "T", "C", "C", "G", "A", "A", "T", "C", "C"])
    }
}
