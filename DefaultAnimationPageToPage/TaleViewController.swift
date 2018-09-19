//
//  TaleViewController.swift
//  DefaultAnimationPageToPage
//
//  Created by Nattapong Unaregul on 1/4/18.
//  Copyright © 2018 Nattapong Unaregul. All rights reserved.
//

import UIKit

class TaleViewController: UIViewController , UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"
        || segue.identifier == "segue2" || segue.identifier == "segue3"
        {
            preparePopoverSegue(on: segue.destination)
        }else if segue.identifier == "segue4" {
            let popoverViewController = segue.destination
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController?.delegate = self
            if let sourceView = popoverViewController.popoverPresentationController?.sourceView {
                popoverViewController.popoverPresentationController?.sourceRect = CGRect(x: sourceView.bounds.midX, y: sourceView.bounds.maxY, width: 0, height: 0)
            }
        }
       
    }
    func preparePopoverSegue(on vc : UIViewController) {
                let popoverViewController = vc
                popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverViewController.popoverPresentationController?.delegate = self
                if let sourceView = popoverViewController.popoverPresentationController?.sourceView {
                    popoverViewController.popoverPresentationController?.sourceRect = CGRect(x: sourceView.bounds.midX, y: sourceView.bounds.maxY, width: 0, height: 0)
                }
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

