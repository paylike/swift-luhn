import Foundation
/**
 Luhn algorithm implementation by Paylike in Apple ecosystem
 
 Luhn algorithm is used to calculate and verify check digit of payment card numbers.
 
 Implemented according to ISO/IEC 7812-1:2015(E) which goes:
 
 1. Double the value of alternate digits beginning with the first right-hand
 digit (low order).
 
 2. Add the individual digits comprising the products obtained in Step 1 to
 each of the unaffected digits in the original number.
 
 3. Subtract the total obtained in Step 2 from the next higher number ending in
 0 [this is the equivalent of calculating the “tens complement” of the
 low-order digit (unit digit) of the total]. If the total obtained in Step 2
 is a number ending in zero (30, 40, etc.), the check digit is 0.
 
 [Wiki](https://en.wikipedia.org/wiki/Luhn_algorithm)
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
