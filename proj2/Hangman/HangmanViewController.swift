//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var wordLetters: UILabel!
    @IBOutlet weak var guessed: UILabel!
    @IBOutlet weak var guess: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    var game: Hangman!
    var numWrongGuesses: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // image.image = UIImage(named: "hangman_0.png")
        // image.image!.drawInRect(CGRect(origin: CGPointZero, size: CGSizeMake(10, 15)))
        game = Hangman()
        loadInterface();
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeGuess() {
        let userGuess = guess.text!
        if userGuess.characters.count != 1 {
            let alert = UIAlertController(title: "Invalid Guess", message: "Please guess one letter at a time.", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "Understood", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
            alert.addAction(alertAction)
            presentViewController(alert, animated: true) { () -> Void in }
        } else {
            let isGuessCorrect: Bool = game.guessLetter(userGuess)
            if !isGuessCorrect {
                numWrongGuesses! += 1
            }
        }
        
        updateDisplay()
    }
    
    func startNewGame() {
        game.start()
        numWrongGuesses = 0
        updateDisplay()
    }
    
    func updateDisplay() {
        guess.text = ""
        guessed.text = game.guesses()
        wordLetters.text = game.knownString!
        if game.knownString! == game.answer! {
            let alert = UIAlertController(title: "You Won!", message: "The secret phrase was \"\(game.answer!)\"", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "One More Round", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                self.startNewGame()
            }
            alert.addAction(alertAction)
            presentViewController(alert, animated: true) { () -> Void in }
        } else if numWrongGuesses >= 6 {
            let alert = UIAlertController(title: "You've Lost!", message: "The secret phrase was \"\(game.answer!)\"", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                self.startNewGame()
            }
            alert.addAction(alertAction)
            presentViewController(alert, animated: true) { () -> Void in }
        }
        image.image = UIImage(named: "hangman_" + String(numWrongGuesses))
    }
    
    func loadInterface() {
        guessButton.addTarget(self, action: "makeGuess", forControlEvents: .TouchUpInside)
        newGameButton.addTarget(self, action: "startNewGame", forControlEvents: .TouchUpInside)
    }
}

