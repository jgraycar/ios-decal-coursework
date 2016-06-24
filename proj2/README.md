# Project 2: Hangman App

## Due
Monday, October 26 at 11:59 PM

## Description
In Homework 3, we gave you most of the basic logic for a functioning Hangman
game. As well, you built UI around the game. In Project 2, you'll be putting
everything together into a well-designed and fully-functional application.
Note that while many of the required features below have already been implemented
in Homework 3, some requirements have changed or been refined.

## Instructions
1. Fork the assignment's repository from (https://github.com/iosdecal).
2. Clone your forked repository to your local machine (the URL should contain
   YOUR_USERNAME/ios-decal-..).
3. **Create Hangman app**
  * Required
    * A "New Game" Button (to start a New Game)
    * A "Guess" Button (for the user to submit a Guess)
    * A method of guessing letters
    * A UILabel that indicates the incorrect guesses (on the same screen)
    * A square-dimensioned UIImageView that represents the "state" of the Hangman
    * Appropriate images for each "state" of the Hangman (we provide basic ones in /basic-hangman-img)
    * Use constraints - any and all views must scale to different devices
    * A working Hangman game
    * A win state, indicated by an Alert (Pop up box)
        * Should prevent additional guesses
    * A fail state, indicated by an Alert (Pop up box)
        * Should prevent additional guesses
    * A "Start Over" button
  * Optional
    * A smart way for the user to guess letters (since a Textfield with keyboard entry is bad UX)
        * Warning: Having a button for each letter is the natural choice. However, consider the
        difficulty of setting constraints on each button. Pursue at your own risk.
    * Customized images for each "state" of the Hangman
4. Add, commit, and push your modified file(s) to your forked remote repository.
