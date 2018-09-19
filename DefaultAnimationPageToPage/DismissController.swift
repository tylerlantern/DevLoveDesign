//
//  DismissController.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 28/3/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit

class DismissController: UIStoryboardSegue {
    override func perform() {
        source.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
