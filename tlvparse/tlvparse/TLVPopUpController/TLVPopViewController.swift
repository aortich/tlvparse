//
//  TLVPopViewController.swift
//  tlvparse
//
//  Created by Alberto Ortiz on 4/16/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import UIKit

class TLVPopViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    var presenter:TLVPopViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = "popupTLV"
        self.view.backgroundColor = UIColor.clear
        if(self.presenter == nil) {
            self.presenter = TLVPopViewPresenter.init(view: self)
        }

        self.popupView.layer.cornerRadius = 3
        self.popupView.layer.shadowOpacity = 0.8
        self.popupView.layer.shadowOffset = CGSize.init(width: 0.0, height: 0.0)
        
        let height:Int = Int(UIScreen.main.bounds.size.height)
        let width:Int = Int(UIScreen.main.bounds.size.width)
        
        var popupFrame:CGRect = self.view.layer.frame
        
        popupFrame.origin.x = CGFloat((width - Int(self.view.bounds.size.width)) / 2)
        popupFrame.origin.y = CGFloat((height - Int(self.view.bounds.size.height)) / 2)
        self.view.layer.frame = popupFrame
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }) { (finished) in
            if(finished) {
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            }
        }
    }
    
    func showInView(aView:UIView, animated:Bool) {
        aView.addSubview(self.view)
        if(animated) {
            self.showAnimate()
        }
    }
    
  
    @IBAction func pressedClose(_ sender: Any) {
        self.removeAnimate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func setDictionaryModel(dictionary:Dictionary<String, Any>) {
        if(self.presenter == nil) {
            self.presenter = TLVPopViewPresenter.init(view: self)
        }
        
        self.presenter?.dictionary = dictionary
    }
}

extension TLVPopViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getNumberOfElements() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.presenter?.buildCellFor(indexPath: indexPath, andTableView: tableView) ?? UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}

extension TLVPopViewController : UITableViewDelegate {
    /*Left blank*/
}
