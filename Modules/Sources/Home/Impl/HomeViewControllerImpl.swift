//
//  File.swift
//  
//
//  Created by Tomas Kohout on 06.06.2023.
//

import Foundation
import UIKit
import HomeApi

final class HomeViewControllerImpl: UIViewController, HomeViewController {
    let viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
