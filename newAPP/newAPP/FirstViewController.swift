//
//  ViewController.swift
//  newAPP
//
//  Created by Дмитрий  on 26.05.2023.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var partnerNameTF: UITextField!
    @IBOutlet weak var yourNameTF: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destanationVC = segue.destination as? ResultViewController else {return}
        destanationVC.firstName = yourNameTF.text
        destanationVC.secondName = partnerNameTF.text
        
    }
    @IBAction func resultButtenTaped() {
        guard let firstName = yourNameTF.text, let secondName = partnerNameTF.text else { return }
        if firstName.isEmpty || secondName.isEmpty {
            let title = NSLocalizedString("8103_TITLe", comment: "")
            let message = NSLocalizedString("8103_Message", comment: "")
            
            showAlert(title: title, message: message)
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
        
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue){
        guard segue.identifier == "unwindSegue" else { return }
        yourNameTF.text = ""
        partnerNameTF.text = ""
        
    }
    
}

extension FirstViewController{
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okeyAction)
        present(alert, animated: true)
    }
}

extension FirstViewController: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF{
            partnerNameTF.becomeFirstResponder()
        }else{
            resultButtenTaped()
        }
        return true
    }
}
