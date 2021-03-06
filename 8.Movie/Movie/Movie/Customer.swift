//
//  Customer.swift
//  Movie
//
//  Created by 윤상진 on 2022/04/03.
//

import Foundation

class Customer {
    let name: String
    private(set) var rentals: [Rental] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(_ rental: Rental) {
        rentals.append(rental)
    }
    
    func statement() -> String {
        var result = "Rental Record for \(name)\n"
        for rental in rentals {
            result += "\t\(rental.movie.title)\t\(rental.getCharge())\n"
        }
        result += "Amount owed is \(getTotalCharge())\n"
        result += "You earned \(getTotalFrequentRenterPoints()) frequent renter points"
        return result
    }
    
    func htmlStateMent() -> String {
        var result = "Rental Record for \(name)\n"
        for rental in rentals {
            result += "\t\(rental.movie.title)\t\(rental.getCharge())\n"
        }
        result += "Amount owed is \(getTotalCharge())\n"
        result += "You earned \(getTotalFrequentRenterPoints()) frequent renter points"
        return result
    }
    
    private func getTotalCharge() -> Double {
        var result = 0.0
        for rental in rentals {
            result += rental.getCharge()
        }
        return result
    }
    
    private func getTotalFrequentRenterPoints() -> Int {
        var result = 0
        for rental in rentals {
            result += rental.getFrequentRenterPoints()
        }
        return result
    }
}
