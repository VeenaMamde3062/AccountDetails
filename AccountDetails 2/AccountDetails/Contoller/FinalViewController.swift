//
//  FinalViewController.swift
//  AccountDetails
//
//  Created by user235115 on 4/4/23.
//

import UIKit

class FinalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailIDField: UITextField!
    @IBOutlet weak var btechField: UITextField!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet var starRating: [UIButton]!
    @IBOutlet var SquareRating: [UIButton]!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailIDField.delegate = self
        btechField.delegate = self
        dobField.delegate = self
        timeField.delegate = self

       
    }
    
    @IBAction func genderSelected(_ sender: UIButton) {
        if sender.tag == 0{
            sender.setImage(UIImage(named: "Ellipse 1032.png"), for: .normal)
            femaleBtn.setImage(UIImage(named: "Path 9461.png"), for: .normal)
        }else{
            sender.setImage(UIImage(named: "Ellipse 1032.png"), for: .normal)
            maleBtn.setImage(UIImage(named: "Path 9461.png"), for: .normal)
        }
    }
    
    @IBAction func starSelected(_ sender: UIButton) {
        var starTag = sender.tag
        for btn in starRating{
            if btn.tag <= starTag{
                btn.setImage(UIImage(named: "star-symbol-icon.png"), for:.normal )
            }else{
                btn.setImage(UIImage(named: "star-half-yellow-icon.png"), for:.normal )
            }
        }
    }
    
    @IBAction func SquareSelected(_ sender: UIButton) {
        var squareTag = sender.tag
        for btn in SquareRating{
            if btn.tag <= squareTag{
                btn.setImage(UIImage(named: "Group 11638.png"), for:.normal )
            }else{
                btn.setImage(UIImage(named: "Rectangle 3770.png"), for:.normal )
            }
        }
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dobField{
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
            dobField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        }
        if textField == timeField{
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .time
            timeField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(timeSelected), for: .valueChanged)
        }
    }
    @objc func timeSelected(){
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        let time = dateFormatter.string(from: datePicker.date)
        timeField.text = time
    }
    @objc func dateSelected(){
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let date = dateFormatter.string(from: datePicker.date)
        dobField.text = date
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var updatedText = ""
        if textField == btechField{
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
        }
        return updatedText.count <= 4
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
