//
//  SaveViewController.swift
//  Task14
//
//  Created by 坂本龍哉 on 2020/10/20.
//

import UIKit

class SaveViewController: UIViewController {
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var additionalTextFIeld: UITextField!

    private(set) var additionalKoumoku :String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveAction(_ sender: Any) {
        additionalKoumoku = additionalTextFIeld.text
        performSegue(withIdentifier: "exit", sender: sender)
    }
}
