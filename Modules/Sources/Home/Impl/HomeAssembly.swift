//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation
import DI
import HomeApi
import FeatureApi

public final class HomeAssembly: DIAssembly {
    public init() {}

    public func assemble(container: DIContainer) {
        container.register(HomeRepositoryFactory.self) { r in
            HomeRepositoryFactoryImpl(stringStore: r.resolve((any StringStore).self), dateStore: r.resolve((any DateStore).self))
        }

        container.register(HomeViewModelFactory.self) { r in
            HomeViewModelFactoryImpl(repositoryFactory: r.resolve(HomeRepositoryFactory.self))
        }

        container.register(HomeViewControllerFactory.self) { r in
            HomeViewControllerFactoryImpl(viewModelFactory: r.resolve(HomeViewModelFactory.self))
        }
    }
}
