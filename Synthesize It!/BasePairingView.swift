//
//  BasePairingView.swift
//  Synthesize It!
//
//  Created by Henry on 4/15/20.
//

import Foundation
import SwiftUI


struct BasePairingView: View{
    @ObservedObject var viewRouter: ViewRouter
    @State var currentBase : String = ""
    @State var rna = RNAStrandView(amminoAcids: [])
    @State var dna = DNAStrandView(amminoAcids: generateRandomSequence(length: 45))
    
    var body : some View{
        ZStack{
            Color(red: 80/255, green: 204/255, blue: 189/255)
                .edgesIgnoringSafeArea(.all)
           
            VStack(alignment: .leading, spacing: 0){
                Button("❓"){
                    self.viewRouter.currentPage = "page2"
                }.frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 25)).edgesIgnoringSafeArea(.horizontal)
                
                Text("DNA").frame(maxWidth: .infinity, alignment: .trailing)
                dna
                rna
                Text("mRNA")
                Spacer()
                HStack{
                    Button(action: {self.currentBase = "A"; let c = self.checkBasePairing(given: self.dna.getCurrentDNABase(), answered: "A");
                        self.buttonPress(correct: c)}){
                        Badge(startGradient: Color(red: 247 / 255, green: 220 / 255, blue: 0 / 255), endGradient: Color(red: 219 / 255, green: 54 / 255, blue: 164 / 255),base: "A")
                    }
                    Button(action: {self.currentBase = "U"; let c = self.checkBasePairing(given: self.dna.getCurrentDNABase(), answered: "U"); self.buttonPress(correct: c)}){
                        Badge(startGradient: Color(red: 219 / 255, green: 54 / 255, blue: 164 / 255), endGradient: Color(red: 247 / 255, green: 220 / 255, blue: 0 / 255) , base: "U")
                    }
                }
                HStack{
                    Button(action: {self.currentBase = "C"; let c = self.checkBasePairing(given: self.dna.getCurrentDNABase(), answered: "C"); self.buttonPress(correct: c)}){
                        Badge(startGradient: Color(red: 11 / 255, green: 72 / 255, blue: 107 / 255), endGradient: Color(red: 245 / 255, green: 98 / 255, blue: 23 / 255),base: "C")
                    }
                    Button(action: {self.currentBase = "G"; let c = self.checkBasePairing(given: self.dna.getCurrentDNABase(), answered: "G"); self.buttonPress(correct: c)}){
                        Badge(startGradient: Color(red: 245 / 255, green: 98 / 255, blue: 23 / 255), endGradient: Color(red: 11 / 255, green: 72 / 255, blue: 107 / 255), base: "G")
                    }
                }
            } // End of VStack
        } // End of ZStack
    } // End of View
    
    func checkBasePairing(given: String, answered: String) -> Bool{
        switch(given){
            case "A":
                return answered == "U"
            case "T":
                return answered == "A"
            case "C":
                return answered == "G"
            case "G":
                return answered == "C"
            default:
                return false;
        }
    }
    
    func buttonPress(correct: Bool){
        if(correct){
            rna.addAcid(acid: currentBase)
            withAnimation{
            rna.popAcid()
            dna.popAcid()
            }
        }
    }
    
}

func generateRandomSequence(length: Int)->[String]{
    let letters = "ATCG"
    var result: [String] = []
    let s = String((0..<length).map{ _ in letters.randomElement()! })
    for c in s{
        result.append(String(c))
    }
    return result
}

struct BasePairingView_Previews: PreviewProvider {
    static var previews: some View {
        BasePairingView(viewRouter: ViewRouter())
    }
}
