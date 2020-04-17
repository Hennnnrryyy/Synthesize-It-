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
            if viewRouter.currentPage == "home" {
                ContentView(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "page2" {
                LessonView(viewRouter: viewRouter, wordBank: ["Transcription", "DNA", "Nucleotides", "mRNA", "Base pairing", "Promoter Sequence"],definitions: ["The process of copying DNA sequence. This is known as the first step in gene expression.", "A sequnece of nucleic acids that are used as information on how to make proteins. Genes are made up of DNA", "Building blocks of DNA. Different sequences of these allows for gene expression to differ. In other words, different nucleotide sequences will produce different proteins. The different nucleotides involved in DNA are: Thymine(T), Adenine(A), Guanine(G), and Cytosine(C). RNA does not contain Thymine, instead it contains Uracil(U).", "Known as the messenger RNA. Its responsibility lies in copying the DNA sequence and carrying it outside of the nucleus.", "DNA is a double stranded molecule. Each strand contains a nucleic acids and their complementary nucleic acid. RNA is a single stranded molecule that copies over the complement nucleic acid for a strand of DNA. The base pairings for copying DNA to mRNA is as follows\nA -> U\nT -> A\nC -> G\nG -> C", "A sequence that defines where transcription starts."],pictures: [Image("Transcription"), Image("DNA"), nil, Image("RNA"), nil, nil])
            }
            else if viewRouter.currentPage == "page3"{
                BasePairingView(viewRouter: viewRouter)
            }
            else if viewRouter.currentPage == "about"{
                AboutView(viewRouter: viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}

