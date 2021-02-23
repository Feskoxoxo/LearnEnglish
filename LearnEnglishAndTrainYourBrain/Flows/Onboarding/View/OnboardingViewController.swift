//
//  OnboardingViewController.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit

class OnboardingViewController: BaseViewController {

    @IBOutlet private weak var nextButton: MainStyleButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textInfoLabel: UILabel!
    @IBOutlet private weak var moreInformationButton: UIButton!
    
    private let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        shouldHideNavigationBar = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureStyle()
        bind()
    }
    
    private func bind() {
        let input = OnboardingViewModel.Input(
            next: nextButton.rx.tap.asDriver()
        )
        
        _ = viewModel.transform(input: input)
    }

    private func configureStyle() {
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }

}
