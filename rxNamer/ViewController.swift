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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    func bind() {
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

}

