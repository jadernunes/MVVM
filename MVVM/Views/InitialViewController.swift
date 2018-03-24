//
//  InitialViewController.swift
//  MVVM
//
//  Created by Jáder Borba Nunes on 28/02/18.
//  Copyright © 2018 jader. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    //MARK: - Variables
    
    /// The view model reference the view
    private let viewModel = RNDViewModel()
    
    /// Label to inform the data requested
    @IBOutlet weak var labelTitle: UILabel!
    
    /// Loader indicator the request network
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!{
        didSet {
            self.activityIndicator.hidesWhenStopped = true
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.onViewUpdate = { [weak self] (viewData: RNDViewData) in
            self?.onViewUpdate(viewData: viewData)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.getNewData()
    }
    
    //MARK: - Outlets
    
    @IBAction func buttonRefreshDataPressed(_ sender: UIBarButtonItem) {
        self.viewModel.getNewData()
    }
    
    //MARK: - Private custom methods
    
    /// Change UI the request network state
    ///
    /// - Parameter isLoading: state request
    private func setNetworkActivityIndicator(isLoading: Bool) {
        
        if isLoading {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        } else {
            self.activityIndicator.stopAnimating()
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
    /**
     Called when the RNDViewData changed and return to the View. In here is set the view data:
     
     **e.g:**
     - self.labelTitle.text = viewData.labelTitle
     
     - Parameter viewData: RNDViewData
    */
    private func onViewUpdate(viewData: RNDViewData){
        DispatchQueue.main.async(execute: { [unowned self] in
            self.labelTitle.text = viewData.labelTitle
            self.setNetworkActivityIndicator(isLoading: viewData.activityIndicatorAnimated)
        })
    }
}

