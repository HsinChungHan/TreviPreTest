//
//  MainVC.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/21.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit
class MainVC: UIViewController {
    var mainView: MainView
    init(whoreCube: Cube) {
        self.mainView = MainView.init(whoreCube: whoreCube)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationItem()
    }
    
    fileprivate func setupLayout(){
        view.addSubview(mainView)
        mainView.fillSuperView()
        
    }
    
    fileprivate func setupNavigationItem(){
        self.setupLeftNavigationItemByTitle(title: "Back", selector: #selector(goBack))
    }
    
    @objc func goBack(){
        dismiss(animated: true){[weak self] in
            self?.mainView.mainViewModel.removeTimer()
        }
    }
}

