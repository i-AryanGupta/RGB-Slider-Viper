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
        // Do any additional setup after loading the view.
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
}

extension HomeViewController: ColorValueDelegate{
    
    func onColorChange() {
        
        let step: Float = 1
        
        let red = round(sliderRed.value/step)*step
        let green = round(sliderGreen.value/step)*step
        let blue = round(sliderBlue.value/step)*step
        
        lbRgbValue.text = "RGB \(red), \(green), \(blue)"
        
        self.view.backgroundColor = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
    }
}

