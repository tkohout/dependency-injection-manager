//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation
import HomeApi
import FeatureApi

class HomeRepositoryImpl: HomeRepository {
    let usage: HomeUsage
    let stringStore: any StringStore
    let dateStore: any DateStore

    init(usage: HomeUsage, stringStore: any StringStore, dateStore: any DateStore) {
        self.usage = usage
        self.stringStore = stringStore
        self.dateStore = dateStore
    }
}
