//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation
import HomeApi

class HomeViewModelFactoryImpl: HomeViewModelFactory {
    let repositoryFactory: HomeRepositoryFactory
    init(repositoryFactory: HomeRepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }

    func make(usage: HomeUsage) -> HomeViewModel {
        HomeViewModelImpl(repository: self.repositoryFactory.make(usage: usage))
    }
}
