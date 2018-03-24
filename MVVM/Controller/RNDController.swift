//
//  RNDController.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 23/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import Foundation

class RNDController {
    
    //MARK: - Variables
    
    /// Api protocol reference
    private let delegate: ApiRequestDelegate
    
    /// Page number, will increase one by one
    private lazy var page: Int = 1
    
    //MARK: - Initializer
    
    /// RNDController initialization
    ///
    /// - Parameter delegate: Optional api protocol reference. You can override it if will be necessary
    init(delegate: ApiRequestDelegate = ApiRequest()) {
        self.delegate = delegate
    }
}

//MARK: - RNDControllerDelegate

extension RNDController: RNDControllerDelegate {
    
    func requestNewData(completion: @escaping RNDModelCompletion) {
        self.delegate.requestRndData(page: self.page) { (data: Any?) in
            self.page += 1
            
            guard
                let json = data as? [String: Any],
                let title = json["title"] as? String else {
                    completion(nil)
                    return
            }
            
            let model = RNDModel(title: title)
            completion(model)
        }
    }
}
