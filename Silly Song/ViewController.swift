//
//  ViewController.swift
//  Silly Song
//
//  Created by Evian tan  on 25/05/2017.
//  Copyright © 2017 Evian tan . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text! = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
    

}



func shortNameForName(name: String) -> String {
    
    let lowerCasedName = name.lowercased()
    let vowelSet = CharacterSet.init(charactersIn: "aeiou")
    var shortName = ""
    
    for character in lowerCasedName.unicodeScalars {
        
        if vowelSet.contains(character) {
            shortName = lowerCasedName.substring(from: lowerCasedName.characters.index(of: Character(character))!)
            return shortName
        }
    }
    
    return lowerCasedName
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

