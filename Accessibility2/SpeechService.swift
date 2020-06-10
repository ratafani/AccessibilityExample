//
//  SpeechService.swift
//  Accessibility2
//
//  Created by Muhammad Tafani Rabbani on 10/06/20.
//  Copyright © 2020 Muhammad Tafani Rabbani. All rights reserved.
//

import AVFoundation
import UIKit

class SpeechService{
    
    let speechSynthizer = AVSpeechSynthesizer()
    
    func say(_ phrase:String){
        
//        guard UIAccessibility.isVoiceOverRunning else {
//            return
//        }
        
        let utterenece = AVSpeechUtterance(string: phrase)
        let langCode = "en-EN".localized
        utterenece.voice = AVSpeechSynthesisVoice(language: langCode)
        speechSynthizer.speak(utterenece)
    }
}

extension String{
    var localized : String{
        return NSLocalizedString(self, comment: "")
    }
}
