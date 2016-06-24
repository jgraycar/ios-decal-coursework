# Meme Generator

## Authors
+ Joel Graycar

## Purpose
**Meme Generator** is an app that allows users to generate their own meme
images ([example](http://www.mememaker.net/static/images/memes/94742.jpg)).

## Features
Users can sign-in/up through their Facebook account. They can create and save
meme images, that are then are tied to their account. When they sign out and
sign back in, their saved images are still present. Users can also easily
share their created images to Facebook.

## Control Flow
When users first open up the app, they will be asked to sign in through
Facebook in order to continue. They can also choose to continue as a guest,
but then the images they create will be unaccessable after they close the app.
After logging in, users will be on the main page, where they can view the
collection of images they've created or choose to create a new one. Clicking
on an image opens it up in a larger view and shows a button to share it to
Facebook.

## Implementation

### Model
+ `Meme.swift`
+ `User.swift`

### View
+ `UserSignInView`
+ `UserMemesCollectionView`
+ `MemeView`
+ `NewMemeView`

### Controller
+ `UserMemesCollectionViewController`
+ `UserSignInViewController`
+ `MemeViewController`
+ `NewMemeViewController`
