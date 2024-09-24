//
//  ViewController.swift
//  RGB Slider Viper
//
//  Created by Yashom on 23/09/24.
//

import UIKit

protocol ColorValueDelegate{
    
    func onColorChange()
}

class HomeViewController: UIViewController {

    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var lbRgbValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rgb = loadColorValue()
        
        sliderRed.value = Float(rgb.0)
        sliderBlue.value = Float(rgb.1)
        sliderGreen.value = Float(rgb.2)
        
        lbRgbValue.text = "RGB \(rgb.0), \(rgb.1), \(rgb.2)"
        self.view.backgroundColor = UIColor(red: rgb.0/255, green: rgb.1/255, blue: rgb.2/255, alpha: 1)
    }

    @IBAction func onRedValueChange(_ sender: UISlider) {
        print("Red value recived \(sender.value)")
        onColorChange()
    }
    
    @IBAction func onGreenValueChange(_ sender: UISlider) {
        print("Green value recived \(sender.value)")
        onColorChange()
    }
    
    @IBAction func onBlueValueChange(_ sender: UISlider) {
        print("Blue value recived \(sender.value)")
        onColorChange()
    }
    
    
    // saving the rgb values
    func saveCurrentColor(rgb:(CGFloat, CGFloat, CGFloat)) -> (Void){
        
        UserDefaults.standard.set(rgb.0, forKey: "Red")
        UserDefaults.standard.set(rgb.1, forKey: "Green")
        UserDefaults.standard.set(rgb.2, forKey: "Blue")
        
        print("color saving")
    }
    
    // load current color, rgb value will be returned 0-255
    func loadColorValue() -> (CGFloat, CGFloat, CGFloat){
        
        let red = CGFloat(UserDefaults.standard.float(forKey: "Red"))
        let green = CGFloat(UserDefaults.standard.float(forKey: "Green"))
        let blue = CGFloat(UserDefaults.standard.float(forKey: "Blue"))
        
        return (red, green, blue)
    }
}

extension HomeViewController: ColorValueDelegate{
    
    func onColorChange() {
        
        let step: Float = 1
        
        let red = CGFloat(round(sliderRed.value/step)*step)
        let green = CGFloat(round(sliderGreen.value/step)*step)
        let blue = CGFloat(round(sliderBlue.value/step)*step)
        
        //assiging the values to label and changing the view background color
        lbRgbValue.text = "RGB \(red), \(green), \(blue)"
        self.view.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        
        saveCurrentColor(rgb: (red, green, blue))
    }
}

