//
//  OnboardingViewController.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit

class OnboardingViewController: BaseViewController {

    @IBOutlet weak var nextButton: UIButton!

    private let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        shouldHideNavigationBar = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        let input = OnboardingViewModel.Input(
            next: nextButton.rx.tap.asDriver()
        )
        
        _ = viewModel.transform(input: input)
    }
}
