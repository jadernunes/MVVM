//
//  RNDViewModel.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 01/03/18.
//  Copyright © 2018 jader. All rights reserved.
//

import Foundation

struct Constants {
    /// Generic error messagem
    static let genericErrorMessage = "No information found"
}

class RNDViewModel {
    
    //MARK: - Variables
    
    /// RNDController protocol reference
    private let delegate: RNDControllerDelegate
    
    /// Controll the data state and initialized with loading state
    private var currentDataState: DataState = .loading
    
    /// Closure to notify the view
    var onViewUpdate: ((RNDViewData) -> Void)?
    
    //MARK: - Initializer
    
    /// Initialize the ViewModel with a delegate if it'll be necessary
    ///
    /// - Parameter delegate: Optional RNDController protocol reference. You can override it if will be necessary
    init(delegate: RNDControllerDelegate = RNDController()) {
        self.delegate = delegate
    }
    
    //MARK: - Private custom methods
    
    /// Called when the data changed to notify the View with new RNDViewData
    ///
    /// - Parameter state: The state of the RNDViewData
    private func changeState(state: DataState){
        self.currentDataState = state
        self.onViewUpdate?(RNDViewData(state: state))
    }
    
    /// A method used to load new data and make controll with data's state
    private func loadNewRndData(){
        self.changeState(state: .loading)
        self.delegate.requestNewData { [unowned self](model: RNDModel?) in
            guard let model = model else {
                self.changeState(state: .loaded(RNDModel(title: Constants.genericErrorMessage)))
                return
            }
            
            self.changeState(state: .loaded(model))
        }
    }
    
    //MARK: - Public custom methods
    
    /// Get new updated data to View Model and then it'll update the title
    func getNewData(){
        self.loadNewRndData()
    }
}
