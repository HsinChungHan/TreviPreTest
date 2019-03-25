//
//  MainView.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/25.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit
class MainView: UIView {
    let mainViewModel = MainViewModel()
    
    fileprivate func setupBindable(){
        mainViewModel.whoreCube.addObserver(observer: self, closure: {[weak self] (cube, _) in
            guard let cube = cube else {return}
            self?.mainViewModel.fillInColumnView(cube: cube, completionHandler: {[weak self] (columnView) in
                columnView.columnViewDelegate = self
                self?.overallStackView.addArrangedSubview(columnView)
            })
        })
        
        mainViewModel.specificCube.addObserver(observer: self) {[weak self] (cube, _) in
            guard let cube = cube else {return}
            self?.mainViewModel.targetColumnView.value = (self?.overallStackView.arrangedSubviews[cube.column] as! ColumnView)
        }
        
        mainViewModel.targetColumnView.addObserver(observer: self) {[weak self] (columnView, _) in
            guard let columnView = columnView else {return}
            columnView.highLight(selectedRow: (self?.mainViewModel.specificCube.value?.row)!)
        }
        
        mainViewModel.lastColumnView.addObserver(observer: self) { [weak self](columnView, _) in
            guard let columnView = columnView else {return}
            columnView.deslect(selectedRow: (self?.mainViewModel.specificCube.value?.row)!)
        }
        
    }
    
    let overallStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init(whoreCube: Cube){
        super.init(frame: .zero)
        setupBindable()
        self.mainViewModel.whoreCube.value = whoreCube
        setupLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout(){
        backgroundColor = .white
        addSubview(overallStackView)
        overallStackView.fillSuperView()
    }
}

extension MainView: ColumnViewDelegate{
    func removeRandom(sender: UIButton) {
        if sender.tag == mainViewModel.specificCube.value?.column{
            self.mainViewModel.deselectedSpecificCube()
        }
    }
}
