//
//  ApiRequest.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 01/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import Foundation

/// Api protocol to request data from server
protocol ApiRequestDelegate {
    
    /// The alias to represent the closure
    typealias ApiDataCompletion = ((Any?) -> Void)
    
    /// Request new random data
    ///
    /// - Parameters:
    ///   - page: number of the random page
    ///   - completion: return a completion response
    func requestRndData(page:Int, withCompletion completion: @escaping ApiDataCompletion)
}
