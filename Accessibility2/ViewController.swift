//
//  ViewController.swift
//  Accessibility+Localization
//
//  Created by Muhammad Tafani Rabbani on 10/06/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let mText = UILabel()
    
    var counter = 0
    let incImg = UIButton()
    let decImg = UIButton()
    let speeceService = SpeechService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mText.textColor = .black
        mText.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        mText.textAlignment = .center
        mText.center = view.center
        mText.text = "0"
        mText.frame.origin.y -= 200
        
        mText.isAccessibilityElement = true
        mText.accessibilityLabel = "numbers of the counter"
        mText.accessibilityValue = mText.text
        mText.font = .preferredFont(forTextStyle: .largeTitle)
        mText.adjustsFontForContentSizeCategory = true

        
        let img = UIImage(systemName: "plus.circle")
        incImg.setImage(img, for: .normal)
        incImg.imageView?.contentMode = .scaleToFill
        incImg.contentVerticalAlignment = .fill
        incImg.contentHorizontalAlignment = .fill
        incImg.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        incImg.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        incImg.center = view.center
        incImg.frame.origin.y += 200
        incImg.frame.origin.x += 100
        incImg.isAccessibilityElement = true
        incImg.accessibilityLabel = "Add Counter"
        
        let img2 = UIImage(systemName: "minus.circle")
        decImg.setImage(img2, for: .normal)
        decImg.imageView?.contentMode = .scaleToFill
        decImg.contentVerticalAlignment = .fill
        decImg.contentHorizontalAlignment = .fill
        decImg.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        decImg.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        decImg.center = view.center
        decImg.frame.origin.y += 200
        decImg.frame.origin.x -= 100
        decImg.isAccessibilityElement = true
        decImg.accessibilityLabel = "Minus Counter"
        
        let addGesture = UITapGestureRecognizer(target: self, action: #selector(increase))
        incImg.addGestureRecognizer(addGesture)
        
        let minGesture = UITapGestureRecognizer(target: self, action: #selector(decrease))
        decImg.addGestureRecognizer(minGesture)
        
        
        view.addSubview(mText)
        view.addSubview(incImg)
        view.addSubview(decImg)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let welcome = "welcoming user".localized
        speeceService.say(welcome)
    }
    
    @objc func increase(_ sender: UIGestureRecognizer){
        counter+=1
        let valuetext = String(counter)
        mText.text = valuetext
        mText.accessibilityValue = mText.text
        speeceService.say("counter increased, now its,".localized + valuetext)
        
    }
    @objc func decrease(_ sender: UIGestureRecognizer){
        
        counter-=1
        let valuetext = String(counter)
        mText.text = valuetext
        mText.accessibilityValue = mText.text
        speeceService.say("counter decreased, now its,".localized + valuetext)
    }
}

