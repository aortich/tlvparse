//
//  TLVPopViewPresenter.swift
//  tlvparse
//
//  Created by Alberto Ortiz on 4/16/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import UIKit

class TLVPopViewPresenter: NSObject {
    var view:TLVPopViewController
    var dictionary:Dictionary<String, Any>?
    
    init(view:TLVPopViewController) {
        self.view = view
    }
    
    func setDictioanary(dictionary:Dictionary<String, Any>) {
        self.dictionary = dictionary
    }
    
    func getNumberOfElements() -> Int {
        return self.dictionary?.count ?? 0
    }
    
    func buildCellFor(indexPath: IndexPath, andTableView tableView:UITableView) -> TagCell? {
        var tagCell:TagCell? = tableView.dequeueReusableCell(withIdentifier: "TagCell") as? TagCell
        if(tagCell == nil) {
            let nib = Bundle.main.loadNibNamed("TagCell", owner: self, options: nil)
            tagCell = nib?[0] as? TagCell
        }
        guard let dic = self.dictionary else {
            tagCell?.lblTag.text = ""
            tagCell?.lblContent.text = ""
            return tagCell
        }
        
        let key:String = Array(dic.keys)[indexPath.row]
        tagCell?.lblTag.text = key
        guard let arg = dic[key] as? CVarArg else {
            tagCell?.lblContent.text = ""
            return tagCell
        }
        
        tagCell?.lblContent.text = String(format: "%@", arg)
        return tagCell
    }
}
