//
//  RGBPresenterProtocol.swift
//  RGB Slider Viper
//
//  Created by Yashom on 25/09/24.
//

import UIKit

protocol RGBPresenterProtocol {
    func onRedValueChange(value: Float)
    func onGreenValueChange(value: Float)
    func onBlueValueChange(value: Float)
    func viewDidLoad()
}

