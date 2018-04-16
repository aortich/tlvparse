//
//  TLVParser.swift
//  tlvparse
//
//  Created by Alberto Ortiz on 4/15/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import UIKit

class TLVParser: NSObject {
    
    func stringToBytes(_ string: String) -> [UInt8]? {
        let length = string.count
        if length & 1 != 0 {
            return nil
        }
        var bytes = [UInt8]()
        bytes.reserveCapacity(length/2)
        var index = string.startIndex
        for _ in 0..<length/2 {
            let nextIndex = string.index(index, offsetBy: 2)
            if let b = UInt8(string[index..<nextIndex], radix: 16) {
                bytes.append(b)
            } else {
                return nil
            }
            index = nextIndex
        }
        return bytes
    }
    
    func bytesToString(bytes: [UInt8]) -> String? {
        let data = NSData(bytes: bytes, length: (bytes.count))
        return String(data: data as Data, encoding: .utf8)
    }
    
    func getLabelName(withTag tag:String) -> String {
        return (TagCatalog().tagMap[tag]?.label ?? "Unknown")
    }
    
    func getContent(fromBytes bytes:[UInt8]?, andTag tag:String) -> String {
        guard let bytes = bytes else {
            return ""
        }
        
        guard let tagProperties = TagCatalog().tagMap[tag] else {
            return (bytes.map { (String(format: "%02hhX", $0) )  }.joined() )
        }
        
        switch(tagProperties.type) {
        case .primitive:
            return (bytes.map { (String(format: "%02hhX", $0) )  }.joined())
            
        case .string:
            return (bytesToString(bytes: bytes) ?? "")
        }

    }
    
    func parseTags(_ str: String) -> Dictionary<String,String>? {
        var result = [String : String]()
        
        guard var bytes = stringToBytes(str) else {
            return nil
        }
        
        while(bytes.count > 0) {
            guard let b = bytes.first else {
                //it's probably null anyway
                return nil
            }
            
            //get tag
            var tag = (String(format: "%02hhX", b))
            bytes.removeFirst()
            if((b & 0x1F) == 0x1F) { //two-byte tag
                if(bytes.count == 0) {
                    //malformed tlv
                    return nil
                }
                
                guard let secondByteTag = bytes.first else {
                    //malformed tlv
                    return nil
                }
                
                tag += (String(format: "%02hhX", secondByteTag))
                bytes.removeFirst()
            }
            
            //get length
            guard let lengthByte = bytes.first else {
                //malformed tlv with no length value
                return nil
            }
            
            let length = Int(lengthByte)
            bytes.removeFirst()
            
            //getContent
            let contentArray = bytes.prefix(length)
            let contentString = getContent(fromBytes: Array(contentArray), andTag: tag)

            if(bytes.count >= length) {
                bytes.removeFirst(length)
            } else {
                //allegedly malformed but still functional
                bytes.removeAll()
            }
            print("content for tag %@: %@", tag, contentString)

            //add tag and content pair to dictionary
            result.updateValue(contentString , forKey: getLabelName(withTag: tag))
        }
        
        print(result)
        return result
    }
}
