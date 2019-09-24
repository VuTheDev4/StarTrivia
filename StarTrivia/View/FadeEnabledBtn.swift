//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by Vu Duong on 9/24/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import Foundation
import UIKit


class FadeEnabledBtn : UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
                
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                    
                }
            }
        }
    }
}
