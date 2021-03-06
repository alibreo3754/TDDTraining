//
//  main.swift
//  SwiftMovie
//
//  Created by 윤상진 on 2022/03/09.
//

import Foundation

struct Play {
    let name: String
    let type: String
}

struct Peformance {
    let playID: String
    let audience: Int
}

struct Invoice {
    let customer: String
    let performances: [Peformance]
}

func statement(invoice: Invoice, plays: [String: Play]) -> String? {
    let totalAmount = 0;
    var volumeCredits = 0;
    var result = "청구 내역 (고객명: \(invoice.customer)\n"
    for performance in invoice.performances {
        let play = plays[performance.playID]!
        var thisAmount = 0
        
        switch play.type {
        case "tragedy":
            thisAmount = 40000
            if (performance.audience > 20) {
                thisAmount += 1000 * (performance.audience - 20)
            }
        case "comedy":
            thisAmount = 30000
            if (performance.audience > 20) {
                thisAmount += 10000 + 500 * (performance.audience - 20)
            }
            thisAmount += 3000 * performance.audience
        default:
            return nil
        }
        volumeCredits += max(performance.audience - 30, 0)
        if "comedy" == play.type {
            volumeCredits += (performance.audience / 5)
        }
        result += "\(play.name): \(thisAmount/100) (\(performance.audience)석\n"
    }
    result += "총액: \(totalAmount/100)\n"
    result += "적립 포인트: \(volumeCredits)점\n"
    return result
}
