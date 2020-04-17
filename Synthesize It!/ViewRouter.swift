//
//  ViewRouter.swift
//  Synthesize It!
//
//  Created by Henry on 4/14/20.
//

import Foundation
import Combine
import Swift

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "home" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
