//
//  SafeExtractArray.swift
//  tips&tricks
//
//  Created by Violence on 28/07/2019.
//  Copyright © 2019 Violence. All rights reserved.
//

//Безопасное извлечение по индексу из массива

import Foundation

extension Collection {
    func safeObject(at index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return safeObject(at: index)
    }
}

extension Array { //best way 0(1) speed
    subscript (safe index: Index) -> Element? {
        return 0 <= index && index < count ? self[index] : nil
    }
}

