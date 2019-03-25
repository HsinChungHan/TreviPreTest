//
//  ColumnViewModel.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/25.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import Foundation
class MainViewModel {
    var specificCube = Observable<Cube>()
    var whoreCube = Observable<Cube>()
    var columnViews = [ColumnView]()
    var targetColumnView = Observable<ColumnView>()
    var lastColumnView = Observable<ColumnView>()
    var timer: Timer?
    
    func fillInColumnView(cube: Cube, completionHandler: @escaping (_ columnView: ColumnView) -> ()) {
        let appendQueue = DispatchQueue.init(label: "com.cube.append")
        appendQueue.sync {[weak self] in
            self?.addTimer()
            for index in 0...cube.column - 1{
                let columnView = ColumnView.init(row:cube.row, column: index)
                self?.columnViews.append(columnView)
                DispatchQueue.main.async {
                    completionHandler(columnView)
                }
            }
        }
    }
    
    func addTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { [weak self](_) in
            self?.deselectedSpecificCube()
            let targetColumn = Int.random(in: 0 ... (self?.whoreCube.value!.column)! - 1)
            let targetRow = Int.random(in: 0 ... (self?.whoreCube.value!.row)! - 1)
            self?.specificCube.value = Cube.init(column: targetColumn, row: targetRow)
        })
        RunLoop.current.add(timer!, forMode: .common)
    }

    func removeTimer(){
        timer?.invalidate()
        timer = nil
    }
    func deselectedSpecificCube(){
        lastColumnView.value = targetColumnView.value
    }

}
