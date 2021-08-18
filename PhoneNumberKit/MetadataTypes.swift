//
//  MetadataTypes.swift
//  PhoneNumberKit
//
//  Created by Roy Marmelstein on 02/11/2015.
//  Copyright © 2021 Roy Marmelstein. All rights reserved.
//

import Foundation

/**
 MetadataTerritory object
 - Parameter codeID: ISO 639 compliant region code
 - Parameter countryCode: International country code
 - Parameter internationalPrefix: International prefix. Optional.
 - Parameter mainCountryForCode: Whether the current metadata is the main country for its country code.
 - Parameter nationalPrefix: National prefix
 - Parameter nationalPrefixFormattingRule: National prefix formatting rule
 - Parameter nationalPrefixForParsing: National prefix for parsing
 - Parameter nationalPrefixTransformRule: National prefix transform rule
 - Parameter emergency: MetadataPhoneNumberDesc for emergency numbers
 - Parameter fixedLine: MetadataPhoneNumberDesc for fixed line numbers
 - Parameter generalDesc: MetadataPhoneNumberDesc for general numbers
 - Parameter mobile: MetadataPhoneNumberDesc for mobile numbers
 - Parameter pager: MetadataPhoneNumberDesc for pager numbers
 - Parameter personalNumber: MetadataPhoneNumberDesc for personal number numbers
 - Parameter premiumRate: MetadataPhoneNumberDesc for premium rate numbers
 - Parameter sharedCost: MetadataPhoneNumberDesc for shared cost numbers
 - Parameter tollFree: MetadataPhoneNumberDesc for toll free numbers
 - Parameter voicemail: MetadataPhoneNumberDesc for voice mail numbers
 - Parameter voip: MetadataPhoneNumberDesc for voip numbers
 - Parameter uan: MetadataPhoneNumberDesc for uan numbers
 - Parameter leadingDigits: Optional leading digits for the territory
 */
public struct MetadataTerritory: Decodable {
    public let codeID: String
    public let countryCode: UInt64
    public let internationalPrefix: String?
    public let mainCountryForCode: Bool
    public let nationalPrefix: String?
    public let nationalPrefixFormattingRule: String?
    public let nationalPrefixForParsing: String?
    public let nationalPrefixTransformRule: String?
    public let preferredExtnPrefix: String?
    public let emergency: MetadataPhoneNumberDesc?
    public let fixedLine: MetadataPhoneNumberDesc?
    public let generalDesc: MetadataPhoneNumberDesc?
    public let mobile: MetadataPhoneNumberDesc?
    public let pager: MetadataPhoneNumberDesc?
    public let personalNumber: MetadataPhoneNumberDesc?
    public let premiumRate: MetadataPhoneNumberDesc?
    public let sharedCost: MetadataPhoneNumberDesc?
    public let tollFree: MetadataPhoneNumberDesc?
    public let voicemail: MetadataPhoneNumberDesc?
    public let voip: MetadataPhoneNumberDesc?
    public let uan: MetadataPhoneNumberDesc?
    public let numberFormats: [MetadataPhoneNumberFormat]
    public let leadingDigits: String?

    public init(
        cID: String,
        cC: UInt64,
        iP: String? = nil,
        mC: Bool = false,
        nP: String? = nil,
        nPFR: String? = nil,
        nPFP: String? = nil,
        nPTR: String? = nil,
        pEP: String? = nil,
        em: MetadataPhoneNumberDesc? = nil,
        fL: MetadataPhoneNumberDesc? = nil,
        gD: MetadataPhoneNumberDesc? = nil,
        mo: MetadataPhoneNumberDesc? = nil,
        pa: MetadataPhoneNumberDesc? = nil,
        pN: MetadataPhoneNumberDesc? = nil,
        pR: MetadataPhoneNumberDesc? = nil,
        sC: MetadataPhoneNumberDesc? = nil,
        tF: MetadataPhoneNumberDesc? = nil,
        vm: MetadataPhoneNumberDesc? = nil,
        vi: MetadataPhoneNumberDesc? = nil,
        uan: MetadataPhoneNumberDesc? = nil,
        nF: [MetadataPhoneNumberFormat] = [],
        lD: String? = nil
    ) {
        codeID = cID
        countryCode = cC
        internationalPrefix = iP
        mainCountryForCode = mC
        nationalPrefix = nP
        nationalPrefixFormattingRule = nPFR
        nationalPrefixForParsing = nPFP
        nationalPrefixTransformRule = nPTR
        preferredExtnPrefix = pEP
        emergency = em
        fixedLine = fL
        generalDesc = gD
        mobile = mo
        pager = pa
        personalNumber = pN
        premiumRate = pR
        sharedCost = sC
        tollFree = tF
        voicemail = vm
        voip = vi
        self.uan = uan
        numberFormats = nF
        leadingDigits = lD
    }
}

/**
 MetadataPhoneNumberDesc object
 - Parameter exampleNumber: An example phone number for the given type. Optional.
 - Parameter nationalNumberPattern:  National number regex pattern. Optional.
 - Parameter possibleNumberPattern:  Possible number regex pattern. Optional.
 - Parameter possibleLengths: Possible phone number lengths. Optional.
 */
public struct MetadataPhoneNumberDesc: Decodable {
    public let exampleNumber: String?
    public let nationalNumberPattern: String?
    public let possibleNumberPattern: String?
    public let possibleLengths: MetadataPossibleLengths?

    public init(
        eN: String? = nil,
        nNP: String? = nil,
        pNP: String? = nil,
        pL: MetadataPossibleLengths? = nil
    ) {
        exampleNumber = eN
        nationalNumberPattern = nNP
        possibleNumberPattern = pNP
        possibleLengths = pL
    }
}

public struct MetadataPossibleLengths: Decodable {
    let national: String?
    let localOnly: String?

    public init(na: String? = nil, lO: String? = nil) {
        national = na
        localOnly = lO
    }
}

/**
 MetadataPhoneNumberFormat object
 - Parameter pattern: Regex pattern. Optional.
 - Parameter format: Formatting template. Optional.
 - Parameter intlFormat: International formatting template. Optional.

 - Parameter leadingDigitsPatterns: Leading digits regex pattern. Optional.
 - Parameter nationalPrefixFormattingRule: National prefix formatting rule. Optional.
 - Parameter nationalPrefixOptionalWhenFormatting: National prefix optional bool. Optional.
 - Parameter domesticCarrierCodeFormattingRule: Domestic carrier code formatting rule. Optional.
 */
public struct MetadataPhoneNumberFormat: Decodable {
    public let pattern: String?
    public let format: String?
    public let intlFormat: String?
    public let leadingDigitsPatterns: [String]?
    public var nationalPrefixFormattingRule: String?
    public let nationalPrefixOptionalWhenFormatting: Bool?
    public let domesticCarrierCodeFormattingRule: String?

    public init(
        pa: String? = nil,
        fo: String? = nil,
        iF: String? = nil,
        lDP: [String]? = nil,
        nPFR: String? = nil,
        nPOWF: Bool? = false,
        dCCFR: String? = nil
    ) {
        pattern = pa
        format = fo
        intlFormat = iF
        leadingDigitsPatterns = lDP
        nationalPrefixFormattingRule = nPFR
        nationalPrefixOptionalWhenFormatting = nPOWF
        domesticCarrierCodeFormattingRule = dCCFR
    }
}

/// Internal object for metadata parsing
internal struct PhoneNumberMetadata: Decodable {
    var territories: [MetadataTerritory]
}
