//
//  RGBInteractor.swift
//  RGB Slider Viper
//
//  Created by Yashom on 25/09/24.
//

import UIKit

class RGBInteractor: RGBInteractorProtocol {
    func saveColor(color: RGBColor) {
        UserDefaults.standard.set(color.red, forKey: "Red")
        UserDefaults.standard.set(color.green, forKey: "Green")
        UserDefaults.standard.set(color.blue, forKey: "Blue")
        print("color saving in userdefault")
    }
    
    func loadColor() -> RGBColor {
        let red = CGFloat(UserDefaults.standard.float(forKey: "Red"))
        let green = CGFloat(UserDefaults.standard.float(forKey: "Green"))
        let blue = CGFloat(UserDefaults.standard.float(forKey: "Blue"))
        print("color loading in userdefault")
        return RGBColor(red: red, green: green, blue: blue)
        
    }
}
