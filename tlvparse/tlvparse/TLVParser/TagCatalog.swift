//
//  TagCatalog.swift
//  tlvparse
//
//  Created by Alberto Ortiz on 4/15/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import UIKit

class TagCatalog: NSObject {
    var tagMap:Dictionary<String, TagProperties>
    
    override init() {
        tagMap = [
            "9F01": TagProperties.init(label: "Acquirer Identifier"),
            "9F40": TagProperties.init(label: "Additional Terminal Capabilities"),
            "81": TagProperties.init(label: "Amount, Authorised (Binary)"),
            "9F02": TagProperties.init(label: "Amount, Authorised (Numeric)", type: .primitive),
            "9F04": TagProperties.init(label: "Amount, Other (Binary)"),
            "9F03": TagProperties.init(label: "Amount, Other (Numeric)", type: .primitive),
            "9F3A": TagProperties.init(label: "Amount, Reference Currency"),
            "9F26": TagProperties.init(label: "Application Cryptogram"),
            "9F42": TagProperties.init(label: "Application Currency Code"),
            "9F44": TagProperties.init(label: "Application Currency Exponent"),
            "9F05": TagProperties.init(label: "Application Discretionary Data"),
            "5F25": TagProperties.init(label: "Application Effective Date"),
            "5F24": TagProperties.init(label: "Application Expiration Date"),
            "94": TagProperties.init(label: "Application File Locator (AFL)"),
            "4F": TagProperties.init(label: "Application Identifier (AID) – card", type: .primitive),
            "9F06": TagProperties.init(label: "Application Identifier (AID) – terminal", type: .primitive),
            "82": TagProperties.init(label: "Application Interchange Profile"),
            "50": TagProperties.init(label: "Application Label"),
            "9F12": TagProperties.init(label: "Application Preferred Name", type: .string),
            "5A": TagProperties.init(label: "Application Primary Account Number (PAN)"),
            "5F34": TagProperties.init(label: "Application Primary Account Number (PAN) Sequence Number"),
            "87": TagProperties.init(label: "Application Priority Indicator"),
            "9F3B": TagProperties.init(label: "Application Reference Currency"),
            "9F43": TagProperties.init(label: "Application Reference Currency Exponent"),
            "61": TagProperties.init(label: "Application Template"),
            "9F36": TagProperties.init(label: "Application Transaction Counter (ATC)"),
            "9F07": TagProperties.init(label: "Application Usage Control"),
            "9F08": TagProperties.init(label: "Application Version Number"),
            "9F09": TagProperties.init(label: "Application Version Number"),
            "89": TagProperties.init(label: "Authorisation Code"),
            "8A": TagProperties.init(label: "Authorisation Response Code"),
            "5F54": TagProperties.init(label: "Bank Identifier Code (BIC)"),
            "8C": TagProperties.init(label: "Card Risk Management Data Object List 1 (CDOL1)"),
            "8D": TagProperties.init(label: "Card Risk Management Data Object List 2 (CDOL2)"),
            "5F20": TagProperties.init(label: "Cardholder Name", type: .string),
            "9F0B": TagProperties.init(label: "Cardholder Name Extended", type: .string),
            "8E": TagProperties.init(label: "Cardholder Verification Method (CVM) List", type: .primitive),
            "9F34": TagProperties.init(label: "Cardholder Verification Method (CVM) Results", type: .primitive),
            "8F": TagProperties.init(label: "Certification Authority Public Key Index"),
            "9F22": TagProperties.init(label: "Certification Authority Public Key Index"),
            "83": TagProperties.init(label: "Command Template"),
            "9F27": TagProperties.init(label: "Cryptogram Information Data"),
            "9F45": TagProperties.init(label: "Data Authentication Code"),
            "84": TagProperties.init(label: "Dedicated File (DF) Name"),
            "9D": TagProperties.init(label: "Directory Definition File (DDF) Name"),
            "73": TagProperties.init(label: "Directory Discretionary Template"),
            "9F49": TagProperties.init(label: "Dynamic Data Authentication Data Object List (DDOL)"),
            "70": TagProperties.init(label: "EMV Proprietary Template"),
            "BF0C": TagProperties.init(label: "File Control Information (FCI) Issuer Discretionary Data"),
            "A5": TagProperties.init(label: "File Control Information (FCI) Proprietary Template"),
            "6F": TagProperties.init(label: "File Control Information (FCI) Template"),
            "9F4C": TagProperties.init(label: "ICC Dynamic Number"),
            "9F2D": TagProperties.init(label: "Integrated Circuit Card (ICC) PIN Encipherment Public Key Certificate"),
            "9F2E": TagProperties.init(label: "Integrated Circuit Card (ICC) PIN Encipherment Public Key Exponent"),
            "9F2F": TagProperties.init(label: "Integrated Circuit Card (ICC) PIN Encipherment Public Key Remainder"),
            "9F46": TagProperties.init(label: "Integrated Circuit Card (ICC) Public Key Certificate"),
            "9F47": TagProperties.init(label: "Integrated Circuit Card (ICC) Public Key Exponent"),
            "9F48": TagProperties.init(label: "Integrated Circuit Card (ICC) Public Key Remainder"),
            "9F1E": TagProperties.init(label: "Interface Device (IFD) Serial Number"),
            "5F53": TagProperties.init(label: "International Bank Account Number (IBAN)"),
            "9F0D": TagProperties.init(label: "Issuer Action Code – Default"),
            "9F0E": TagProperties.init(label: "Issuer Action Code – Denial"),
            "9F0F": TagProperties.init(label: "Issuer Action Code – Online"),
            "9F10": TagProperties.init(label: "Issuer Application Data"),
            "91": TagProperties.init(label: "Issuer Authentication Data"),
            "9F11": TagProperties.init(label: "Issuer Code Table Index"),
            "5F28": TagProperties.init(label: "Issuer Country Code"),
            "5F55": TagProperties.init(label: "Issuer Country Code (alpha2 format)"),
            "5F56": TagProperties.init(label: "Issuer Country Code (alpha3 format)"),
            "42": TagProperties.init(label: "Issuer Identification Number (IIN)"),
            "90": TagProperties.init(label: "Issuer Public Key Certificate"),
            "9F32": TagProperties.init(label: "Issuer Public Key Exponent"),
            "92": TagProperties.init(label: "Issuer Public Key Remainder"),
            "86": TagProperties.init(label: "Issuer Script Command"),
            "9F18": TagProperties.init(label: "Issuer Script Identifier"),
            "71": TagProperties.init(label: "Issuer Script Template 1"),
            "72": TagProperties.init(label: "Issuer Script Template 2"),
            "5F50": TagProperties.init(label: "Issuer URL"),
            "5F2D": TagProperties.init(label: "Language Preference"),
            "9F13": TagProperties.init(label: "Last Online Application Transaction Counter (ATC) Register"),
            "9F4D": TagProperties.init(label: "Log Entry"),
            "9F4F": TagProperties.init(label: "Log Format"),
            "9F14": TagProperties.init(label: "Lower Consecutive Offline Limit"),
            "9F15": TagProperties.init(label: "Merchant Category Code"),
            "9F16": TagProperties.init(label: "Merchant Identifier", type: .string),
            "9F4E": TagProperties.init(label: "Merchant Name and Location", type: .string),
            "9F17": TagProperties.init(label: "Personal Identification Number (PIN) Try Counter"),
            "9F39": TagProperties.init(label: "Point-of-Service (POS) Entry Mode"),
            "9F38": TagProperties.init(label: "Processing Options Data Object List (PDOL)"),
            "80": TagProperties.init(label: "Response Message Template Format 1"),
            "77": TagProperties.init(label: "Response Message Template Format 2"),
            "5F30": TagProperties.init(label: "Service Code", type: .primitive),
            "88": TagProperties.init(label: "Short File Identifier (SFI)"),
            "9F4B": TagProperties.init(label: "Signed Dynamic Application Data"),
            "93": TagProperties.init(label: "Signed Static Application Data"),
            "9F4A": TagProperties.init(label: "Static Data Authentication Tag List"),
            "9F33": TagProperties.init(label: "Terminal Capabilities"),
            "9F1A": TagProperties.init(label: "Terminal Country Code"),
            "9F1B": TagProperties.init(label: "Terminal Floor Limit"),
            "9F1C": TagProperties.init(label: "Terminal Identification"),
            "9F1D": TagProperties.init(label: "Terminal Risk Management Data"),
            "9F35": TagProperties.init(label: "Terminal Type"),
            "95": TagProperties.init(label: "Terminal Verification Results"),
            "9F1F": TagProperties.init(label: "Track 1 Discretionary Data"),
            "9F20": TagProperties.init(label: "Track 2 Discretionary Data"),
            "57": TagProperties.init(label: "Track 2 Equivalent Data"),
            "98": TagProperties.init(label: "Transaction Certificate (TC) Hash Value"),
            "97": TagProperties.init(label: "Transaction Certificate Data Object List (TDOL)"),
            "5F2A": TagProperties.init(label: "Transaction Currency Code"),
            "5F36": TagProperties.init(label: "Transaction Currency Exponent"),
            "9A": TagProperties.init(label: "Transaction Date"),
            "99": TagProperties.init(label: "Transaction Personal Identification Number (PIN) Data"),
            "9F3C": TagProperties.init(label: "Transaction Reference Currency Code"),
            "9F3D": TagProperties.init(label: "Transaction Reference Currency Exponent"),
            "9F41": TagProperties.init(label: "Transaction Sequence Counter"),
            "9B": TagProperties.init(label: "Transaction Status Information"),
            "9F21": TagProperties.init(label: "Transaction Time"),
            "9C": TagProperties.init(label: "Transaction Type"),
            "9F37": TagProperties.init(label: "Unpredictable Number"),
            "9F23": TagProperties.init(label: "Upper Consecutive Offline Limit")]
    }
}

class TagProperties: NSObject {
    var label:String?
    var type:Type
    
    override init() {
        self.label = ""
        self.type = .primitive
    }
    
    init(label:String) {
        self.label = label
        self.type = .primitive
    }
    
    init(label:String, type:Type) {
        self.label = label
        self.type = type
    }
}

enum Type {
    case string
    case primitive
}
