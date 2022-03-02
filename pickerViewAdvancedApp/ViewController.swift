//
//  ViewController.swift
//  pickerViewAdvancedApp
//
//  Created by Tuğberk Can Özen on 2.03.2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // PickerView içerisinde göstereceğimiz elemanlar
    let iphoneModels = ["iphone 7", "iphone 8","iphone X","iphone 11","iphone 13"]
    
    // Kaç adet pickerView olacağını söylediğimiz fonksiyon
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // PickerView içerisindeki elemanların sayısını burada .count diyerek saydırıyoruz.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return iphoneModels.count
    }
    // Satır içeriğine row ile erişerek elemanlarımızı yerleştiriyoruz
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iphoneModels[row]
    }
    // textField ile elemanlarımızı eşitleyerek ekranda anlık gösterilmesini sağladık
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = iphoneModels[row]
    }
    
    // PickerView objesi eklemediğimiz için sınıfına bu şekilde erişiyoruz.
    let picker = UIPickerView()
    
    @IBOutlet weak var pickerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerToolBar() // Aşağıda yazdığımız fonksiyonu viewDidload içerisinde gösterdik
        pickerTextField.inputView = picker //textField'ın girdisini picker ile eşitledik böylece seçtiğimiz şeyler textField içinde görünecek
        picker.delegate = self
        picker.dataSource = self
    }

    
    // PickerView'a OK button koyabilmek için toolbar isminde bir fonksiyon oluşturduk
    func pickerToolBar() {
        
        let toolBar = UIToolbar() // Toolbar sınıfına erişmek için bir sabite atadık
        toolBar.sizeToFit() // Toolbar'ın boyutunu ayarladık
        pickerTextField.inputAccessoryView = toolBar // Daha sonra bu textfield'a toolbar'ı ekledik
        
        // Uibarbutton item ile done ok'e tıklandıktan sonra kapanması için bir dismisspicker objc func oluşturduk ve selector'e koyduk
        let doneButton = UIBarButtonItem(title: "OK", style: UIBarButtonItem.Style.done, target: self, action: #selector(dismissPicker))
        // toolBar içerisine sistemimizden doneButton'ı koyduk.
        toolBar.setItems([doneButton], animated: true)
        // Tıklanabilir olduğunu belirttik
        toolBar.isUserInteractionEnabled = true
    }
    
    @objc func dismissPicker() {
        // tıklandıktan sonra düzenlemeyi durdumasını yani pickerView'ın kapanmasını sağladık
        view.endEditing(true)
    }
    
    
}

