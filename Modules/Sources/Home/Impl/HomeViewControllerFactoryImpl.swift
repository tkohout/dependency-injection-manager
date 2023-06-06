//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation
import HomeApi

class HomeViewControllerFactoryImpl: HomeViewControllerFactory {
    let viewModelFactory: HomeViewModelFactory

    init(viewModelFactory: HomeViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }

    func make(usage: HomeUsage) -> HomeViewController {
        HomeViewControllerImpl(viewModel: self.viewModelFactory.make(usage: usage))
    }
}
