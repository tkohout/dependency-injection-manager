//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation

public protocol HomeViewControllerFactory {
    func make(usage: HomeUsage) -> HomeViewController
}
