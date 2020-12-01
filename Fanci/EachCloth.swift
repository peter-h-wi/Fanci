//
//  EachCloth.swift
//  Fanci
//
//  Created by Peter Wi on 7/16/20.
//  Copyright © 2020 PeterWi. All rights reserved.
//

import Foundation

class EachCloth {
    private(set) var clothID: UUID
    private(set) var clothImageD: Data
    private(set) var clothType: String
    private(set) var clothColor: String
    private(set) var clothSize: String
    
    init(clothImageD: Data, clothType: String, clothColor: String, clothSize: String) {
        self.clothID = UUID()
        self.clothImageD = clothImageD
        self.clothType = clothType
        self.clothColor = clothColor
        self.clothSize = clothSize
    }
    
    init(clothID: UUID, clothImageD: Data, clothType: String, clothColor: String, clothSize: String) {
        self.clothID = clothID
        self.clothImageD = clothImageD
        self.clothType = clothType
        self.clothColor = clothColor
        self.clothSize = clothSize
    }
}
