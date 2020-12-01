//
//  CategoryRow.swift
//  Fanci
//
//  Created by Peter Wi on 7/18/20.
//  Copyright © 2020 PeterWi. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var env : GlobalEnvironment
    var fetchRequest: FetchRequest<Cloth>
    var filteredCloth: FetchedResults<Cloth> {
        fetchRequest.wrappedValue
    }
    
    var clothType: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(clothType)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(filteredCloth, id: \.self) { cloth in
                        CategoryItem(cloth: cloth)
                    }
                }
            }
            .frame(height: 185)
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Cloth>(entity: Cloth.entity(), sortDescriptors: [], predicate: NSPredicate(format: "type == %@", filter))
        clothType = filter
    }
}



struct CategoryItem: View {
    var cloth: Cloth
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(uiImage: UIImage(data: cloth.imageD!)!)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(cloth.color! + " " + cloth.type!)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}
