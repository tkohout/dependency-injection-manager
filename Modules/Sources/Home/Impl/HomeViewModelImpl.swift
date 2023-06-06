//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation
import HomeApi

class HomeViewModelImpl: HomeViewModel {
    let repository: HomeRepository
    init(repository: HomeRepository) {
        self.repository = repository
    }
}
