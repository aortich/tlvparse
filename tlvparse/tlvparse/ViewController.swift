//
//  ViewController.swift
//  tlvparse
//
//  Created by Alberto Ortiz on 4/15/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tapGesture:UITapGestureRecognizer?
    var presenter:ViewControllerPresenter?
    @IBOutlet weak var tvString: UITextView!
    @IBOutlet weak var btnParse: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.didTapAnywhere(_:)))
        self.view.addGestureRecognizer(self.tapGesture!)
        self.btnParse.accessibilityIdentifier = "parseButton"
        self.tvString.accessibilityIdentifier = "tvTLV"
        self.presenter = ViewControllerPresenter.init(view: self)
        
    }
    
    @objc func didTapAnywhere(_ gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func pressedParse(_ sender: Any) {
        if(self.tvString.text == nil || self.tvString.text.count == 0) {
            UIAlertController.init(title: "Empty string", message: "Please fill out the text view so I can parse it!", preferredStyle: .alert).show(self, sender: nil)
        }
        
        self.presenter?.parseTLV(self.tvString.text)
        
    }
    
    func showParseResult(_ dictionary:Dictionary<String,Any>) {
        let tlvPop:TLVPopViewController = TLVPopViewController()
        self.addChildViewController(tlvPop)
        tlvPop.setDictionaryModel(dictionary: dictionary)
        tlvPop.showInView(aView: self.view, animated: true)
    }
    
}

