//
//  SwiftParserTests.swift
//  PhoneNumberKit
//
//  Created by Alex Babaev on 18 August 2021.
//  Copyright © 2021 Alex Babaev. All rights reserved.
//

import XCTest
@testable import PhoneNumberKit

/// Testing partial formatter. Goal is to replicate formatting behaviour of Apple's dialer.
class SwiftParserTests: XCTestCase {
    func testSwiftParsing() {
        let swiftCode: String = PreLoadedMetadata.convertJSONToSwift()
        print(swiftCode)
    }
}
