import UIKit

// Note: - Write a function to reverse a string. Func must have one input: string, and an output: string. Where the output is the input reversed. You can not use .reversed.

// How does .reversed work exactly?
// To get the reversed version of a string, reverse its characters and initialize a new String instance from the result.

func reverseString(with string: String) -> String {
    
    // Have each letter replace the opposite indexed letter?
    
    let word = string
    let reversedWord = String(word.reversed())
    return reversedWord
}
print(reverseString(with: "Chase"))

