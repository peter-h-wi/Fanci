//
//  GlobalEnvironment.swift
//  Fanci
//
//  Created by Peter Wi on 7/15/20.
//  Copyright © 2020 PeterWi. All rights reserved.
//

import SwiftUI

class GlobalEnvironment: ObservableObject {
    @Published var clothColors = ["Red", "Orange", "Yellow", "Green", "Blue", "Pink", "Purple", "White", "Grey", "Black", "Silver", "Gold"]
    @Published var clothSizes = ["Extra Small", "Small", "Medium", "Large", "Extra Large"]
    @Published var clothTypes = ["Hat", "Top", "Bottoms", "Shoes"]
}
