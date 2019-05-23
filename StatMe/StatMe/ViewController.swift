//
//  ViewController.swift
//  StatMe
//
//  Created by CJ on 5/13/19.
//  Copyright © 2019 CJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var SportLabel: UILabel!
    @IBOutlet weak var SportPicker: UIPickerView!
    @IBOutlet weak var teamName: UITextField!
    
    let sports = ["Football", "Basketball", "Baseball", "Soccer"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sports[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sports.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SportLabel.text = sports[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = teamName.text
    }

}


