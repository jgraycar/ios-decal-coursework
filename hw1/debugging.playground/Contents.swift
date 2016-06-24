//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]!
        wordB = words[1]!
    }
    
//: This is incorrect because to unwrap optionals you use an exclamation mark (!),
//: not a question mark (?). Question marks are for declaring the optional type,
//: ie that a function returns an optional or a variable is an optional.
    

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    class func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: The compiler is complaining about this for-loop because we declare our counter
//: variable i using let. let is the keyword reserved for declaring constants; since
//: i is incremented with every iteration of the loop, it should not be a constant.
//: Instead, we should declare it using the keyword var. Instead of returning nil
//: we should return true, since the return type is an unwrapped boolean and so
//: should never be nil.
    
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    class func isAnagram(wordA: String, wordB: String) -> Bool! {
        var countLetters : [Character : Int] = [Character : Int]()
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: Since booleans should only ever be true or false, the return type should be an
//: unwrapped Bool!, not an optional (Bool?). That also means changing the final line
//: to return true rather than return nil. The dictionary is also not being initialized
//: currently, only having its type declared. It needs to be initialized to an empty
//: dictionary by adding = [Character : Int]().


//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

