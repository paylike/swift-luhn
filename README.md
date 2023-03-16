# PaylikeLuhn

[![build_tests](/../../actions/workflows/swift.yml/badge.svg?branch=main)](/../../actions/workflows/swift.yml)

Calculate/verify check digit (luhn) of credit cards

This library is a clone of the original javascript [implementation from Paylike](https://github.com/paylike/luhn).

## Install

__SPM__:
```swift
// dependencies: 
.package(url: "git@github.com:paylike/swift-luhn.git", .upToNextMajor(from: "0.2.0")

// target:
.product(name: "PaylikeLuhn", package: "swift-luhn")
```

__Cocoapods__:
https://cocoapods.org/pods/PaylikeLuhn
```ruby
pod 'PaylikeLuhn'
```

## Usage

```swift
// Is the card number valid?
let card = "6123451234567893"
PaylikeLuhn.isValid(card)    // true


// Calculate check digit
// MII + IIN + "Individual account number"
let incomplete = "612345123456789"

PaylikeLuhn.calculateCheckDigit(incomplete);    // "1"
```

Implemented according to ISO/IEC 7812-1:2015(E) which goes:

1. Double the value of alternate digits beginning with the first right-hand
   digit (low order).

2. Add the individual digits comprising the products obtained in Step 1 to
   each of the unaffected digits in the original number.

3. Subtract the total obtained in Step 2 from the next higher number ending in
   0 [this is the equivalent of calculating the “tens complement” of the
   low-order digit (unit digit) of the total]. If the total obtained in Step 2
   is a number ending in zero (30, 40, etc.), the check digit is 0.
