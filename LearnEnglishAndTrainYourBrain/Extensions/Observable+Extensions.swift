//
// Created by Anton on 14.02.2021.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {

    func asDriverOnErrorJustComplete() -> Driver<Element> {
        asDriver { _ in .empty() }
    }

}