//
//  ClothTypeView.swift
//  Fanci
//
//  Created by Peter Wi on 7/24/20.
//  Copyright © 2020 PeterWi. All rights reserved.
//

import SwiftUI

struct ClothTypeView: View {
    @EnvironmentObject var env : GlobalEnvironment

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach (env.clothTypes.sorted(), id: \.self) { clothType in

                        VStack{
                            Text("\(clothType)")

                        }
                    }
                }
            }
        }
    }
}

struct ClothTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ClothTypeView()                                .environmentObject(GlobalEnvironment())

    }
}
