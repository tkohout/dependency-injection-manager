//
//  ViewController.swift
//  TestingGrounds
//
//  Created by Miguel Batista on 24/05/2023.
//

import DI
import FeatureApi
import UIKit

class ViewController: UIViewController {
    private let repository: FeatureRepository

    init(repository: FeatureRepository) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue

        _ = repository.fetchDate()
        _ = repository.fetchString()
    }
}
