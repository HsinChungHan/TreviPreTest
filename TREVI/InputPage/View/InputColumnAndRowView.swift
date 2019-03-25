//
//  InputView.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/25.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit
protocol InputViewDelegate: class {
    func naviToMainVC(naviVC: UINavigationController)
}


class InputColumnAndRowView: UIView {
    weak var inputViewDelegate: InputViewDelegate?
    
    var inputViewModel = InputViewModel()
    
    let stackView: UIStackView = {
       let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 20
        return sv
    }()
    
    lazy var textFields = ["Input column here", "Input row here"].compactMap { (str) -> UITextField in
        let textField = UITextField.init()
        textField.placeholder = str
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return textField
    }
    
    @objc fileprivate func handleTextChange(textField: UITextField) {
        if textField == textFields[0] {
            inputViewModel.columnText = textField.text
        } else {
            inputViewModel.rowText = textField.text
        }
    }
    
    lazy var submitbutton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.lightGray
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(submit(sender:)), for: .touchUpInside)
        return btn
    }()
    
    @objc func submit(sender: UIButton){
        inputViewModel.submit { [weak self](row, column) in
            let naviVC = UINavigationController.init(rootViewController: MainVC.init(whoreCube: Cube.init(column: column, row: row)))
            self?.inputViewDelegate?.naviToMainVC(naviVC: naviVC)
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        setupBindable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout(){
        backgroundColor = .white
        textFields.forEach { (textField) in
            stackView.addArrangedSubview(textField)
        }
        stackView.addArrangedSubview(submitbutton)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/3).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100).isActive = true
    }
    
    fileprivate func setupBindable(){
        inputViewModel.isFormValid.addObserver(observer: self) { [unowned self](isValid, _) in
            guard let isValid = isValid else {return}
            self.submitbutton.isEnabled = isValid
            self.submitbutton.backgroundColor = isValid ? #colorLiteral(red: 0.8235294118, green: 0, blue: 0.3254901961, alpha: 1) : .lightGray
            self.submitbutton.setTitleColor(isValid ? .white : .gray, for: .normal)
        }
    }
    
}
