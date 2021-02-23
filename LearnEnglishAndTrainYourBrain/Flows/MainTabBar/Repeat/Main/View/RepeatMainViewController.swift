//
//  RepeatViewController.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 23.02.2021.
//

import UIKit

class RepeatMainViewController: BaseViewController {
    
    @IBOutlet private weak var startButton: UIButton!
    
    private let viewModel: RepeatMainViewModel

    init(viewModel: RepeatMainViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
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
        let input = RepeatMainViewModel.Input(
            next: startButton.rx.tap.asDriver()
        )

        _ = viewModel.transform(input: input)
    }

    private func configureStyle() {
//        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }

}
