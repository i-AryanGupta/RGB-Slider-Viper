//
//  RGBInteractorProtocol.swift
//  RGB Slider Viper
//
//  Created by Yashom on 25/09/24.
//

import UIKit

protocol RGBInteractorProtocol{
    func saveColor(color: RGBColor)
    func loadColor() -> RGBColor
}
