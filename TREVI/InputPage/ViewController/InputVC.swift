//
//  InputVC.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/21.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//
import UIKit
class InputVC: UIViewController {
    
    let inputColumnAndRowView = InputColumnAndRowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputColumnAndRowView.inputViewDelegate = self
        setupLayout()
    }
    
    fileprivate func setupLayout(){
        view.addSubview(inputColumnAndRowView)
        inputColumnAndRowView.fillSuperView()
    }
}

extension InputVC: InputViewDelegate{
    func naviToMainVC(naviVC: UINavigationController) {
        present(naviVC, animated: true, completion: nil)
    }
    
    
}
