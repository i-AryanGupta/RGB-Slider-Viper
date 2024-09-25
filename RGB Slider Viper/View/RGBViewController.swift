//
//  RGBViewController.swift
//  RGB Slider Viper
//
//  Created by Yashom on 25/09/24.
//

import UIKit

class RGBViewController: UIViewController, RGBViewProtocol {

    // Connecting IBOutlets for the sliders and label from the storyboard
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var lbRgbValue: UILabel!
    
    
    var presenter: RGBPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RGBViewController: viewDidLoad")

        if let presenter = presenter {
            print("Presenter is set")
            presenter.viewDidLoad()
        } else {
            print("Presenter is NOT set")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("RGBViewController: viewWillAppear")
    }

    deinit {
        print("RGBViewController is being deallocated")
    }
    
    // IBActions linked to the sliders in storyboard
    @IBAction func onRedValueChange(_ sender: UISlider) {
        // Ensure presenter is not nil when this method is called
                if let presenter = presenter {
                    presenter.onRedValueChange(value: sender.value)
                    print("Red value changed")
                } else {
                    print("Presenter is NOT set during red slider change")
                }
        
    }
    
    @IBAction func onGreenValueChange(_ sender: UISlider) {
        print("Green value recived \(sender.value)")
        presenter?.onGreenValueChange(value: sender.value)
    }
    
    @IBAction func onBlueValueChange(_ sender: UISlider) {
        print("Blue value recived \(sender.value)")
        presenter?.onBlueValueChange(value: sender.value)
    }
    
    // Update the background color of the view based on the color provided by the presenter
    func updateBackgroundColor(color: RGBColor) {
        DispatchQueue.main.async {
                    self.view.backgroundColor = UIColor(red: color.red/255, green: color.green/255, blue: color.blue/255, alpha: 1)
                }
                print("Updated RGB background")
    }
    
    // Update the RGB label and sliders based on the color
    func updateRGBLabel(color: RGBColor) {
        DispatchQueue.main.async {
                    self.lbRgbValue.text = "RGB \(Int(color.red)), \(Int(color.green)), \(Int(color.blue))"
                    self.sliderRed.value = Float(color.red)
                    self.sliderGreen.value = Float(color.green)
                    self.sliderBlue.value = Float(color.blue)
                }
                print("Updated RGB label")
    }
}
