import Foundation
/**
 Responsible for executing the luhn algorithm
 */
public enum PaylikeLuhn {
    /**
     Returns if a card number is valid or not
     */
    public static func isValid(cardNumber: String) -> Bool {
        if cardNumber.isEmpty {
            return false
        }
        return String(cardNumber.last!) == calculateCheckDigit(cardNumber: cardNumber)
    }

    /**
     Returns the check digit of the card number used for validation
     */
    public static func calculateCheckDigit(cardNumber: String) -> String {
        let range = cardNumber.startIndex ..< cardNumber.index(before: cardNumber.endIndex)
        return calculate(cardNumber: String(cardNumber[range]))
    }

    /**
     Sums the digits of the card number
      */
    private static func sumDigits(cardNumber: String) -> Int {
        cardNumber.reduce(0) { result, c in
            guard let curr = Int(String(c)) else {
                return 0
            }
            return result + curr
        }
    }

    /**
     Calculates the digit required for checking
     */
    private static func calculate(cardNumber: String) -> String {
        let length = cardNumber.count

        let product = cardNumber.enumerated().reduce(0) { p, c in
            guard let element = Int(String(c.element)) else {
                return 0
            }
            if (c.offset + length) % 2 == 1 {
                return p + sumDigits(cardNumber: String(element * 2))
            }
            return p + element
        }
        let result = (10 - (product % 10)) % 10
        return String(result)
    }
}
