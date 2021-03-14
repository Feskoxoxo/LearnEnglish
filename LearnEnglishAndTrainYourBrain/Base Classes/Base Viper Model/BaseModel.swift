//
//  BaseModel.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 14.03.2021.
//

import UIKit

protocol Module {
    associatedtype Input
    associatedtype Output

    var view: UIViewController { get }
    var input: Input? { get }
    var output: Output? { get }

    init(view: UIViewController, input: Input?, output: Output?)
}

class BaseModule<I, O>: Module {
    typealias Input = I
    typealias Output = O

    var view: UIViewController
    var input: Input?
    var output: Output?

    required init(view: UIViewController, input: Input?, output: Output?) {
        self.view = view
        self.input = input
        self.output = output
    }
}
