//
//  RNDModel.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 23/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import Foundation

struct RNDModel : Equatable {
    
    /// String title
    private var title: String
    
    /// Initialize the Model with title
    ///
    /// - Parameters:
    ///   - title: a String that could be long
    init(title: String = "") {
        self.title = title
    }
    
    /// Get title of the model
    ///
    /// - Returns: a string title
    func getTitle() -> String {
        return self.title
    }
    
    /// Use to compare models
    ///
    /// - Parameters:
    ///   - lhs: RNDModel 1
    ///   - rhs: RNDModel 2
    /// - Returns: A boolean variable compared models
    static func ==(lhs: RNDModel, rhs: RNDModel) -> Bool {
        return lhs.title == rhs.title
    }
}
