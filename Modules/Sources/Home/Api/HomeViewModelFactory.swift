//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation

public protocol HomeViewModelFactory {
    func make(usage: HomeUsage) -> HomeViewModel
}
