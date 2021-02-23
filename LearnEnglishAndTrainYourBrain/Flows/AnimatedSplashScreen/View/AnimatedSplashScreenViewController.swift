//
//  AnimatedSplashScreenViewController.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit
import Lottie
import Cartography
import RxSwift

class AnimatedSplashScreenViewController: BaseViewController {

    private let animationView = AnimationView()
    private let viewModel: AnimatedSplashScreenViewModel
    private let animationFinished = BehaviorSubject<Bool>(value: false)

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    init(viewModel: AnimatedSplashScreenViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        shouldHideNavigationBar = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationView.play { [weak self] _ in
            self?.animationFinished.onNext(true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldHideNavigationBar = true

        configureAnimation()
        bind()
    }

    private func bind() {
        let input = AnimatedSplashScreenViewModel.Input(
            next: animationFinished.asDriverOnErrorJustComplete()
        )

        _ = viewModel.transform(input: input)
    }

    private func configureAnimation() {
        guard let animation = Animation.named("LaunchScreen") else {
            return
        }
        
        animationView.animation = animation
        animationView.backgroundBehavior = .pauseAndRestore
        
        view.addSubview(animationView)
        
        constrain(animationView, view) { animationView, this in
            animationView.center == this.center
            animationView.width == this.width * 0.6
        }
    }

}
