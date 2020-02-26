//
//  ViewController.swift
//  HM2
//
//  Created by Oleksii ZHYHADLO on 2/21/20.
//  Copyright © 2020 Oleksii ZHYHADLO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewPresrntColorOutlet: UIView!
    @IBOutlet var sliderRedOutlet: UISlider!
    @IBOutlet var sliderGreenOutlet: UISlider!
    @IBOutlet var sliderBlueOutlet: UISlider!
    
    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLable()
        setupTextField()
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        guard let tag = EnumarateRGB(rawValue: sender.tag) else { return }
        
        switch tag {
        case .red:
            actionSlider(sliderRedOutlet, textFieldRed, labelRed)
        case .green:
            actionSlider(sliderGreenOutlet, textFieldGreen, labelGreen)
        case .blue:
            actionSlider(sliderBlueOutlet, textFieldBlue, labelBlue)
        }
    }
    
    //MARK: - Methods
    private func changeColorView() {
        
        viewPresrntColorOutlet.backgroundColor = UIColor(red: CGFloat(sliderRedOutlet.value),
                                                         green: CGFloat(sliderGreenOutlet.value),
                                                         blue: CGFloat(sliderBlueOutlet.value),
                                                         alpha: 1)
    }
    
    private func setupView() {
        
        viewPresrntColorOutlet.layer.cornerRadius = 20
        changeColorView()
    }
    
    private func setupLable() {
        
        labelRed.text = String(sliderRedOutlet.value)
        labelGreen.text = String(sliderGreenOutlet.value)
        labelBlue.text = String(sliderBlueOutlet.value)
    }
    
    private func errorAlert() {
        
        let alert = UIAlertController(title: "Bad value",
                                      message: "Plese enter value betven 0 and 1",
                                      preferredStyle: .alert)
        let btnAlert = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(btnAlert)
        present(alert, animated: true)
    }
    
    private func setupTextField() {
        
        let toolBar = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "Done",
                                      style: .done,
                                      target: self,
                                      action: #selector(doneBtnAction))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        toolBar.setItems([flexibleSpace, doneBtn], animated: false)
        toolBar.sizeToFit()
        
        textFieldRed.inputAccessoryView = toolBar
        textFieldGreen.inputAccessoryView = toolBar
        textFieldBlue.inputAccessoryView = toolBar
        
        textFieldRed.text = String(sliderRedOutlet.value)
        textFieldGreen.text = String(sliderGreenOutlet.value)
        textFieldBlue.text = String(sliderBlueOutlet.value)
    }
    
    private func actionSlider(_ slider: UISlider, _ textField: UITextField, _ label: UILabel) {
        
        let valueInString = String(format: "%.2f", slider.value)
        
        textField.text = valueInString
        label.text = valueInString
        changeColorView()
    }
    
    @objc private func doneBtnAction() {
        view.endEditing(true)
    }
    
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    enum EnumarateRGB: Int{
        case red = 0, green, blue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let tag = EnumarateRGB(rawValue: textField.tag) else { return }
        
        switch tag {
        case .red:
            changeValueAfterEdit(textFieldRed, sliderRedOutlet, labelRed)
        case .green:
            changeValueAfterEdit(textFieldGreen, sliderGreenOutlet, labelGreen)
        case .blue:
            changeValueAfterEdit(textFieldBlue, sliderBlueOutlet, labelBlue)
        }
    }
    
    private func changeValueAfterEdit(_ textField: UITextField, _ slider: UISlider, _ label: UILabel) {
        
        guard var stringFloat = textField.text, !stringFloat.isEmpty else {
            textField.text = label.text
            return
        }
        
        stringFloat = stringFloat.replacingOccurrences(of: ",", with: ".")
        if let valueFloat = Float(stringFloat), valueFloat >= 0, valueFloat <= 1 {
            slider.value = valueFloat
            label.text = String(format: "%.2f", valueFloat)
            changeColorView()
        } else {
            textField.text = label.text
            errorAlert()
        }
    }
    
    
}
