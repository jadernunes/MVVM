//
//  RNDViewData.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 01/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

/// State of the data
///
/// - loading: Used when start the request data
/// - loaded: Used when the request finished
/// - error: Used to inform a new
enum DataState {
    case loading
    case loaded(RNDModel)
    case error(String)
}

struct RNDViewData: Equatable {
    
    /// Title could be contain a error title
    var labelTitle: String?
    
    /// Inform a loader indicator
    var activityIndicatorAnimated: Bool
    
    /// Private init with title and state of the loader
    ///
    /// - Parameters:
    ///   - textTitle: String
    ///   - activityIndicatorAnimated: Bool
    private init(textTitle: String?, activityIndicatorAnimated: Bool = false){
        self.labelTitle = textTitle
        self.activityIndicatorAnimated = activityIndicatorAnimated
    }
    
    /// Initialize with a state of the ViewData
    ///
    /// - Parameter state: state of the view data and can be: .loading, .loaded(Model) or .error(message)
    init(state: DataState) {
        switch state {
        case .loading:
            self.init(textTitle: nil, activityIndicatorAnimated: true)
            break
        case .loaded(let rnd):
            self.init(textTitle: rnd.getTitle(), activityIndicatorAnimated: false)
            break
        case .error(let message):
            self.init(textTitle: message, activityIndicatorAnimated: false)
            break
        }
    }
    
    /// Use to compare ViewDatas
    ///
    /// - Parameters:
    ///   - lhs: RNDViewData 1
    ///   - rhs: RNDViewData 2
    /// - Returns: A boolean variable to compare ViewData
    static func ==(lhs: RNDViewData, rhs: RNDViewData) -> Bool {
        return lhs.labelTitle == rhs.labelTitle
            && lhs.activityIndicatorAnimated == rhs.activityIndicatorAnimated
    }
}
