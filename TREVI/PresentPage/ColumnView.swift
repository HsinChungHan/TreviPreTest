//
//  ColumnView.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/22.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit
protocol ColumnViewDelegate: class {
    func removeRandom(sender: UIButton)
}

class ColumnView: UIView {
    var row: Int
    var column: Int
    lazy var labels = createLabels()
    
    fileprivate func createLabels() -> [UILabel]{
        var labels = [UILabel]()
        for _ in 0...row - 1{
            let label = UILabel()
            label.backgroundColor = UIColor.setRandomColor()
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.boldSystemFont(ofSize: 25)
            labels.append(label)
        }
        return labels
    }
    
    weak var columnViewDelegate: ColumnViewDelegate?
    lazy var ensurebutton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("確定", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.black
        btn.addTarget(self, action: #selector(ensure(sender:)), for: .touchUpInside)
        btn.tag = column
        btn.layer.borderWidth = 6.0
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15.0
        btn.clipsToBounds = true
        return btn
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    @objc func ensure(sender: UIButton){
        columnViewDelegate?.removeRandom(sender: sender)
    }
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupLayout(){
        addSubview(stackView)
        labels.forEach { (label) in
            stackView.addArrangedSubview(label)
        }
        stackView.addArrangedSubview(ensurebutton)
        stackView.fillSuperView(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func highLight(selectedRow: Int){
        backgroundColor = .blue
        (stackView.arrangedSubviews[selectedRow] as! UILabel).text = "random"
        ensurebutton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    func deslect(selectedRow: Int){
        backgroundColor = .white
        (stackView.arrangedSubviews[selectedRow] as! UILabel).text = ""
        ensurebutton.backgroundColor = .black
    }
}

