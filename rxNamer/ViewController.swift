//
//  ViewController.swift
//  rxNamer
//
//  Created by Ricardo Herrera Petit on 4/21/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var helloLbl: UILabel!
    @IBOutlet weak var nameEntryTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var namesLbl: UILabel!
    
    let disposeBag = DisposeBag()
    var namesArray: Variable<[String]> = Variable([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextField()
        bindSubmitButton()
    }

    func bindTextField() {
        nameEntryTextField.rx.text
            .map {
                if $0 == "" {
                    return "Type your name below"
                } else {
                    return "Hello, \($0!)."
                }
        }
        .bind(to: helloLbl.rx.text)
        .disposed(by: disposeBag)
    }
    
    func bindSubmitButton() {
        submitBtn.rx.tap
            .subscribe(onNext: {
            if self.nameEntryTextField.text != "" {
                self.namesArray.value.append(self.nameEntryTextField.text!)
                self.namesLbl.rx.text.onNext(self.namesArray.value.joined(separator: ", "))
                self.nameEntryTextField.rx.text.onNext("")
                self.helloLbl.rx.text.onNext("Type your name below")
            }
            })
            .disposed(by: disposeBag)
    }

}

