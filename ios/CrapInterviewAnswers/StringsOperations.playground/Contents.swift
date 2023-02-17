import UIKit

var input = "fun&!! Time"

func LongestWord(str: String) -> String {
  var result = ""
  var count = 0
  var input = str
  input.removeAll(where: {$0.isPunctuation})
  
  for word in input.split(separator: " ") {
    if word.count > count {
      count = word.count
      result = String(word)
    }
  }
  
  return result
}

print(LongestWord(str: input))

input =  "I Love Code"

func FirstReverse(str: String) -> String {
  var result = ""
  
  for word in input.split(separator: " ") {
    for character in word {
      result = "\(character)" + result
    }
    result = " " + result
  }
  
  return result
}

print(FirstReverse(str: input))

input = "acc?7??sss?3rr1??????5"

func QuestionsMarks(str: String) -> Bool {
  var shouldCount = false
  var countQuestionMark = 0
  var countNumber = 0
  let maxQuestionMarkCount = 3
  let maxCountNumber = 10
  
  for string in str {
    if string.isNumber {
      shouldCount = !shouldCount
    }
    
    if string == "?" {
      countQuestionMark += 1
    }
    
    if (countQuestionMark >= maxQuestionMarkCount) && shouldCount {
      if (countQuestionMark >= maxQuestionMarkCount) && (countNumber >= maxCountNumber) {
        return true
      }
      
      countQuestionMark = 0
      shouldCount = false
    }
    
    if string.isNumber && shouldCount {
      countNumber += Int(String(string)) ?? 0
    }
  }
  
  return false
}

print(QuestionsMarks(str: input))
