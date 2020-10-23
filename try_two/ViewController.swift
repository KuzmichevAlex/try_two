//
//  ViewController.swift
//  try_two
//
//  Created by Александр Кузьмичев on 23.10.2020.
//  Copyright © 2020 Александр Кузьмичев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segmenteControl: UISegmentedControl!
    @IBOutlet var mainLable: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var fieldOfText: UITextField!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pickerOfData: UIDatePicker!
    @IBOutlet var lableOfSwich: UILabel!
    @IBOutlet var removeObjects: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Setup main Label
        mainLable.font = mainLable.font.withSize(35)
        mainLable.textAlignment = .center
        mainLable.numberOfLines = 2
        
        // Setup segmented Control
        segmenteControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        //Setup slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .purple
        
        mainLable.text = String(slider.value)
        
        //Setup Date Picker
        pickerOfData.locale = Locale.init(identifier: "ru_RU")
        // Локализация в соответствии с текущими настройками системы
        //pickerOfData.locale = Locale.current
        
        removeObjects.onTintColor = .red
        lableOfSwich.text = "Скрыть все элементы"
    }
    
    @IBAction func changeSegments() {
        switch segmenteControl.selectedSegmentIndex {
        case 0:
            mainLable.text = "The First segment is selected"
            mainLable.textColor = .red
        case 1:
            mainLable.text = "The Second segment is selected"
            mainLable.textColor = .blue
        case 2:
            mainLable.text = "The Third segment is selected"
            mainLable.textColor = .yellow
        default:
            break
        }
    }
    
    @IBAction func moovingSlider() {
        let backgroudColor = view.backgroundColor
        view.backgroundColor = backgroudColor?.withAlphaComponent(CGFloat(slider.value))
        mainLable.text = String(slider.value)
    }
    @IBAction func pressStartButton() {
        guard let inputText = fieldOfText.text, !inputText.isEmpty else {return}
        
        if let _ = Double(inputText) {
            showAlert(title: "Wrong format!", mesage: "Please enter your name")
        print("Wrong format!")
        } else {
        mainLable.text = inputText
            fieldOfText.text = nil
        }
    }
    
    @IBAction func changeData() {
        let dateFormator = DateFormatter()
        dateFormator.dateStyle = .medium
        dateFormator.locale = Locale(identifier: "ru_RU")
        
        let dateValue = dateFormator.string(from: pickerOfData.date)
        mainLable.text = dateValue
    }
    
        
    @IBAction func removingObjectsInScreen() {
        segmenteControl.isHidden.toggle()
        mainLable.isHidden.toggle()
        slider.isHidden.toggle()
        fieldOfText.isHidden.toggle()
        startButton.isHidden.toggle()
        pickerOfData.isHidden.toggle()
        
        lableOfSwich.text = removeObjects.isOn ? "Показать все элементы" : "Скрыть все элементы"
    }
    

}

extension ViewController {
    private func showAlert(title: String, mesage: String) {
        let alert = UIAlertController(
            title: title,
            message: mesage,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.fieldOfText.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
