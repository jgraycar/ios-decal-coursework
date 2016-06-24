//
//  Hangman.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import Foundation

class Hangman {
    var words: HangmanWords!
    var answer: String?
    var knownString: String?
    var guessedLetters: [String]
    
    init() {
        words = HangmanWords()
        guessedLetters = [String]()
    }
    
    func start() {
        let word = words.getRandomWord()
        answer = word.uppercaseString
        knownString = ""
        for (var i = 0; i < answer!.characters.count; i += 1) {
            if (word as NSString).substringWithRange(NSMakeRange(i, 1)) == " " {
                knownString = knownString! + " "
            } else {
                knownString = knownString! + "_"
            }
        }
        guessedLetters = [String]()
    }
    
    func guessLetter(var letter: String) -> Bool {
        letter = letter.uppercaseString
        var result = false
        if guessedLetters.contains(letter) {
            return true
        }
        guessedLetters.append(letter)
        var chars = Array(answer!.characters)
        
        for (var i = 0; i < answer!.characters.count; i += 1) {
            if String(chars[i]) == letter {
                result = true
                knownString = "\((knownString! as NSString).substringToIndex(i))" + "\(letter)"
                            + "\((knownString! as NSString).substringFromIndex(i+1))"
            }
            
        }
        return result
    }
    
    func guesses() -> String {
        let incorrectGuesses = guessedLetters.filter() {
            return answer!.rangeOfString($0) == nil
        }
        if incorrectGuesses.count <= 0 {
            return ""
        }
        var result: String = incorrectGuesses[0]
        for (var i = 1; i < incorrectGuesses.count; i += 1) {
            result = result + ", \(incorrectGuesses[i])"
        }
        return result
    }

}