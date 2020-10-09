//
//  ViewController.swift
//  TaskPalindrome
//
//  Created by Ivan Simunovic on 05/10/2020.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var palindromeTextField: UITextField!
    
    
    
    var validator = InputValidator()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PALINDROME"
        
        palindromeTextField.setBottomBorder()
        
        palindromeTextField.delegate = self
    }

    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    //MARK: Actions
    @IBAction func checkInput(_ sender: UIButton) {
        guard let userText = palindromeTextField.text?.lowercased() else {
            return
        }
        
        validateInput(userText)
    }


    // Validate Input
    func validateInput(_ userText: String){
        let isValidExpression = self.validator.isValidExpression(userText)
        
        if(!isValidExpression){
            showInvalidExpressionAlert()
            return
        }
        
        let isPalindrome = self.validator.isPalindrome(userText)
        if(isPalindrome){
            showPalindromeAlert()
            return
        } else {
            showNotPalindromeAlert()
        }
    }

    //MARK: Alert calls
    func showInvalidExpressionAlert(){
        let alert = UIAlertController(title: "Incorrect!", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.setValue(getInvalidExpressionMessage(), forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "Try again", style: .destructive, handler: {(action:UIAlertAction!) in
            self.palindromeTextField.text = nil
        }))
        
        self.present(alert, animated: true)
    }
    
    func showPalindromeAlert(){
        let alert = UIAlertController(title: "Correct!", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.setValue(getPalindromMessage(), forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "Enter new palindrome", style: .destructive, handler: {(action:UIAlertAction!) in
            self.palindromeTextField.text = nil
        }))
        
        self.present(alert, animated: true)
    }
    
    func showNotPalindromeAlert(){
        let alert = UIAlertController(title: "Incorrect!", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.setValue(getNotPalindromeMessage(), forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "Try again", style: .destructive, handler: {(action:UIAlertAction!) in
            self.palindromeTextField.text = nil
        }))
        
        self.present(alert, animated: true)
    }
    
    private func getInvalidExpressionMessage() -> NSAttributedString {
        let mutableAttString = NSMutableAttributedString()
        
        let primaryMesage = NSAttributedString(string: "Entry was not a valid word. Try to add \n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
        ])
        
        let secondaryMessage = NSAttributedString(string: "a word which is a palindrome", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)
        ])
        mutableAttString.append(primaryMesage)
        mutableAttString.append(secondaryMessage)
        
        return mutableAttString
    }
    
    private func getPalindromMessage() -> NSAttributedString {
        let mutableAttString = NSMutableAttributedString()
        
        let primaryMesage = NSAttributedString(string: "This word is a palindrome! \n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
        ])
        
        let secondaryMessage = NSAttributedString(string: "Do you know any other palindrome?", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.systemGreen
        ])
        mutableAttString.append(primaryMesage)
        mutableAttString.append(secondaryMessage)
        
        return mutableAttString
    }
    
    private func getNotPalindromeMessage() -> NSAttributedString {
        let mutableAttString = NSMutableAttributedString()
        
        let primaryMesage = NSAttributedString(string: "The entered word is not a palindrome\n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
        ])
        
        let secondaryMessage = NSAttributedString(string: "Try other word.", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.systemRed
        ])
        mutableAttString.append(primaryMesage)
        mutableAttString.append(secondaryMessage)
        
        return mutableAttString
    }
    
}

//MARK: Extensions
extension UITextField {
  func setBottomBorder() {
    self.borderStyle = .none
    self.layer.backgroundColor = UIColor.white.cgColor

    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }
}
