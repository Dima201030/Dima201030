//
//  ViewControllerResultViewController.swift
//  newAPP
//
//  Created by Дмитрий  on 26.05.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLable: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var namesLable: UILabel!
    
    var firstName: String!
    var secondName: String!
    
    
    private var resultValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultValue = findResult()
        
        namesLable.text = "\(firstName ?? "") and \(secondName ?? "")"
        
        resultLable.text = resultValue.formatted(.percent)
        progressView.progress = Float(resultValue) / 100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
    }
    
    @IBAction func backButtenTaped() {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
    
    private func findValue(for  name: String) -> Int {
        var count = 0
        for character in name.lowercased(){
            switch character {
            case "q":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "t":
                count += 4
            case "h", "x":
                count += 5
            case "u", "v", "w":
                count += 6
            case "z":
                count += 7
            case "f", "p":
                count += 8
            case "d", "i", "m", "a", "o", "n", "e", "y":
                count += 1
            default:
                count += 0
            }
        }
        return count
    }
    
    
    private func findResult() -> Int {
        
        var result = 0
        
        let firstName = findValue(for: firstName)
        let secondName = findValue(for: secondName)
        let absDiffrence = abs(firstName - secondName)
        
        switch absDiffrence {
        case 0, 1, 2:
            result = 100
        case 3, 4:
            result = 65
        case 5:
            result = 50
        case 6:
            result = 40
        default:
            result = 30
        }
        return result
    }
}
