//
//  AddNameVC.swift
//  rxNamer
//
//  Created by Ricardo Herrera Petit on 4/21/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddNameVC: UIViewController {

    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    let disposeBag = DisposeBag()
    let nameSubject = PublishSubject<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindSubmitBtn()
    }
    
    func bindSubmitBtn() {
        submitBtn.rx.tap
            .subscribe(onNext: {
                if self.newNameTextField.text != "" {
                    self.nameSubject.onNext(self.newNameTextField.text!)
                }
                //self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
}
