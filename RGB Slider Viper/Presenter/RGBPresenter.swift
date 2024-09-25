//
//  RGBPresenter.swift
//  RGB Slider Viper
//
//  Created by Yashom on 25/09/24.
//

import UIKit

class RGBPresenter: RGBPresenterProtocol {

    var view: RGBViewProtocol? // No longer weak to ensure it's retained
    var interactor: RGBInteractorProtocol?

    func viewDidLoad() {
        let color = interactor?.loadColor() ?? RGBColor(red: 255, green: 255, blue: 255)
        view?.updateRGBLabel(color: color)
        view?.updateBackgroundColor(color: color)
    }

    func onRedValueChange(value: Float) {
        updateColor(red: CGFloat(value), green: nil, blue: nil)
        print("Red value updated in presenter: \(value)")
    }

    func onGreenValueChange(value: Float) {
        updateColor(red: nil, green: CGFloat(value), blue: nil)
        print("Green value updated in presenter: \(value)")
    }

    func onBlueValueChange(value: Float) {
        updateColor(red: nil, green: nil, blue: CGFloat(value))
        print("Blue value updated in presenter: \(value)")
    }

    private func updateColor(red: CGFloat?, green: CGFloat?, blue: CGFloat?) {
        let currentColor = interactor?.loadColor() ?? RGBColor(red: 255, green: 255, blue: 255)
        let newColor = RGBColor(
            red: red ?? currentColor.red,
            green: green ?? currentColor.green,
            blue: blue ?? currentColor.blue
        )
        interactor?.saveColor(color: newColor)
        view?.updateRGBLabel(color: newColor)
        view?.updateBackgroundColor(color: newColor)

        print("color updated in presenter: \(newColor)")
    }
}
