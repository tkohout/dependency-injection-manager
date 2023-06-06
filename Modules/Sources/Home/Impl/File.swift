//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation
import HomeApi
import FeatureApi

class HomeRepositoryFactoryImpl: HomeRepositoryFactory {
    let stringStore: any StringStore
    let dateStore: any DateStore

    init(stringStore: any StringStore, dateStore: any DateStore) {
        self.stringStore = stringStore
        self.dateStore = dateStore
    }

    func make(usage: HomeUsage) -> HomeRepository {
        HomeRepositoryImpl(usage: usage, stringStore: stringStore, dateStore: dateStore)
    }
}
