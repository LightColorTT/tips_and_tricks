//
//  AlternateArrayDataAccess.swift
//  tips&tricks
//
//  Created by Violence on 28/07/2019.
//  Copyright © 2019 Violence. All rights reserved.
//

import Foundation

//Альтернативный доступ к данным в массиве

struct Human {
    var age: Int
    var name: String
}

extension Array where Element == Human {
    
    subscript(name value: String) -> [Human] {
        return filter { $0.name == value }
    }
    
    subscript(age value: Int) -> [Human] {
        return filter { $0.age == value }
    }
    
    var names: [String] {
        return [String](Set(map {$0.name} )).sorted() //without double
    }
    
}

extension Array {
    subscript(condition : (Element) -> Bool) -> [Element] {
        return filter(condition)
    }
}

class HumanTest {
    var humans: [Human] = [Human(age: 11, name: "Ivan"),
                                        Human(age: 22, name: "Max"),
                                        Human(age: 33, name: "Boris"),
                                        Human(age: 11, name: "R2D2"),
                                        Human(age: 22, name: "Ivan"),
                                        Human(age: 33, name: "Max"),
                                        Human(age: 11, name: "Ivan"),
                                        Human(age: 22, name: "Ilon"),
                                        Human(age: 33, name: "Vova"),
                                        Human(age: 11, name: "Max")]
    
    func test() {
        //humansAll22yo
        _ = humans[age: 22]
        //humansAllNameBoris
        _ = humans[name: "Boris"]
        //humansAllCondition
        _ = humans[ { $0.name == "Max" && $0.age < 2 } ]
        //humansAllNames + Condition
        _ = humans[ {$0.age > 11} ].names
    }
}
