
//
//  InputViewMOdel.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/25.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import Foundation
class InputViewModel {
    var columnText: String?{didSet{checkFormValidity()}}
    
    var rowText: String?{didSet{checkFormValidity()}}
    
    var isFormValid = Observable<Bool>()

    
    fileprivate func checkFormValidity() {
        if columnText?.isEmpty == false && rowText?.isEmpty == false{
            if let row = Int(rowText!), let column = Int(columnText!){
                let isValid = row > 0 && column > 0
                self.isFormValid.value = isValid
            }
        }else{
            self.isFormValid.value = false
        }
        
    }
    
    func submit(completion: @escaping (_ row: Int, _ column: Int) -> ()) {
        guard let row = Int(rowText!), let column = Int(columnText!)else{ return }
        completion(row, column)
    }
}
