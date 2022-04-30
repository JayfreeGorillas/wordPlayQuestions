//
//  ViewController.swift
//  Countriess
//
//  Created by Josfry Barillas on 4/27/22.
//

import UIKit

class ViewController: UIViewController {

    var allCountries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let countryWordsURL = Bundle.main.url(forResource: "countries", withExtension: "txt") {
            if let countryWords = try? String(contentsOf: countryWordsURL) {
                allCountries = countryWords.components(separatedBy: "\n")
               // print(allCountries)
            } else {
                allCountries = ["wheresMyWordsAt"]
                //print(allCountries)
            }
        }
        countryWithShortestName()
        //countriesWithMoreVowelsThanFiftyPercent(searchCharOne: "a", searchCharTwo: "e", searchCharThree: "i", searchCharFour: "o", searchCharFive: "u")
        //countriesBeginningAndEndingWithvowel(searchCharOne: "a", searchCharTwo: "e", searchCharThree: "i", searchCharFour: "o", searchCharFive: "u")
        //countriesWithUnited(searchChar: "United")
        
    }

    
    func countriesWithUnited(searchChar: String) {
        var unitedInName = [String]()
        
        for country in allCountries where country.contains(searchChar) {
            unitedInName.append(country)
        }
        print(unitedInName)
    }
    
    func countriesBeginningAndEndingWithvowel(searchCharOne: String, searchCharTwo: String, searchCharThree: String, searchCharFour: String, searchCharFive: String) {
        var countWithVowels = [String]()
        
        for country in allCountries  {
           var lowerCaseCountry = country.lowercased()
            if lowerCaseCountry.starts(with: searchCharOne) && lowerCaseCountry.hasSuffix(searchCharOne) {
                print(lowerCaseCountry)
            } else if lowerCaseCountry.starts(with: searchCharTwo) && lowerCaseCountry.hasSuffix(searchCharTwo) {
                print(lowerCaseCountry)
            } else if lowerCaseCountry.starts(with: searchCharThree) && lowerCaseCountry.hasSuffix(searchCharThree) {
                print(lowerCaseCountry)
            } else if lowerCaseCountry.starts(with: searchCharFour) && lowerCaseCountry.hasSuffix(searchCharFour) {
                print(lowerCaseCountry)
            } else if lowerCaseCountry.starts(with: searchCharFive) && lowerCaseCountry.hasSuffix(searchCharFive) {
                print(lowerCaseCountry)
            }
        }
        print(countWithVowels)
    }
    
    func countriesWithMoreVowelsThanFiftyPercent(searchCharOne: Character, searchCharTwo: Character, searchCharThree: Character, searchCharFour: Character, searchCharFive: Character) {
        var vowelCount = 0
        var countryCountHalf = 0
        var countriesWithLotsOfVowels = [String]()
        
        for country in allCountries   {
           var lowerCasedCountries = country.lowercased()
            var totalAs = 0
            var totalEs = 0
            var totalIs = 0
            var totalOs = 0
            var totalUs = 0
           
            countryCountHalf = country.count / 2
            
            for letter in lowerCasedCountries {
                if letter == searchCharOne {
                    totalAs += 1
                } else if letter == searchCharTwo {
                    totalEs += 1
                } else if letter == searchCharThree {
                    totalIs += 1
                } else if letter == searchCharFour {
                    totalOs += 1
                } else if letter == searchCharFive {
                    totalUs += 1
                }
                vowelCount = totalAs + totalEs + totalIs + totalOs + totalUs
                
            }
            
            
            if vowelCount > countryCountHalf {
                print("lots of vowels in this country right here \(country)")
                vowelCount = 0
                countriesWithLotsOfVowels.append(country)
            } else {
                print("not enought vowels in this country: \(country)")
                vowelCount = 0
            }
            print(countriesWithLotsOfVowels)
    }

}
    
    func countryWithShortestName() {
        var smallestCountryName = [String]()
        var tiedCountries = [String]()
        var countriesShorterThanTheRest = [String]()
        
        for country in allCountries.dropFirst() {
            smallestCountryName.append(country)
            
            guard var previous = smallestCountryName.first else {return}
            if var smallest = smallestCountryName.min(by: { $0.count < $1.count } ){
                    
                if smallest.count <= previous.count && smallest.count < country.count {
                    print(smallest, previous, country)
                 //   print(country)
                } else if smallest.count == country.count {
                    smallest = country
                }
                print(smallest)
                previous = country
                if countriesShorterThanTheRest.contains(smallest) {
                  //  print("allready in the array :\(smallest)")
                } else {
                    
                    countriesShorterThanTheRest.append(smallest)
                   // print(countriesShorterThanTheRest)
                }
                
            }

        }
        print(countriesShorterThanTheRest)
        guard var shortWord = countriesShorterThanTheRest.first else {return}
        
        for word in countriesShorterThanTheRest.dropLast() {
            if word.count >= shortWord.count {
                print("word is to high")
            } else if word.count < shortWord.count {
                print("word is lowering")
            }
            shortWord = word
        }
        
        //MARK: - TODO find a way to find the shortest elements and add them to the tied array
    }

}

/*
 func shortestWordContainingVowels(searchCharOne: String, searchCharTwo: String, searchCharThree: String, searchCharFour: String, searchCharFive: String) {
     var smallestWord = [String]()
     for word in allWords where word.contains(searchCharOne) && word.contains(searchCharTwo) && word.contains(searchCharThree) && word.contains(searchCharFour) && word.contains(searchCharFive) {
         smallestWord.append(word)
         if let smallest = smallestWord.min(by: {$0.count < $1.count}) {
             print(smallest)
         }
         
     }
     
     
 }
 */
