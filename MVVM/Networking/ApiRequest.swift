//
//  ApiRequest.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 01/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ApiRequest {
    
    //MARK: - Variables
    
    /// Default interface
    private let httpInterface: SessionManager
    
    /// Default Alamofire initialization
    private var alamoFireManager: Alamofire.SessionManager = { () -> Alamofire.SessionManager in
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
    
    //MARK: - Initializer
    
    /// Initialize the Api with initial configurations
    ///
    /// - Parameter httpInterface: Optional http interface delegate of the type: SessionManager
    init(httpInterface: SessionManager = SessionManager()) {
        self.httpInterface = httpInterface
    }
}

//MARK: - ApiRequestDelegate

extension ApiRequest: ApiRequestDelegate {
    func requestRndData(page:Int, withCompletion completion: @escaping ApiDataCompletion) {
        
        let urlString = "https://hacker-news.firebaseio.com/v0/item/\(page).json?print=pretty"
        
        self.httpInterface.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseJSON(queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default), options: JSONSerialization.ReadingOptions.allowFragments) { (response: DataResponse) in
                completion(response.result.value)
        }
    }
}
