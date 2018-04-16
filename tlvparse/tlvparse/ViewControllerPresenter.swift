//
//  ViewControllerPresenter.swift
//  tlvparse
//
//  Created by Alberto Ortiz on 4/15/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import UIKit

class ViewControllerPresenter: NSObject {
    var view:ViewController
    
    init(view: ViewController) {
        self.view = view
    }
    
    func parseTLV(_ str:String) {
        if(str.count == 0) {
            return
        }
        
        let parser = TLVParser.init()
        self.view.showParseResult(parser.parseTags(str) ?? [String : Any]())
    }

}
