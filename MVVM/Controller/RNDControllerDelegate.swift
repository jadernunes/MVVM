//
//  RNDControllerDelegate.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 23/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import Foundation

/// RNDController protocol to request Model(RNDModel) to Api
protocol RNDControllerDelegate  {
    
    /// The alias to represent the closure of the RNDModel
    typealias RNDModelCompletion = ((RNDModel?) -> Void)
    
    /// Request to Api new RNDModel updated
    ///
    /// - Parameter completion: return a completion response
    func requestNewData(completion: @escaping RNDModelCompletion)
}
