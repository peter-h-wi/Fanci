//
//  InCategoryView.swift
//  Fanci
//
//  Created by Peter Wi on 7/22/20.
//  Copyright © 2020 PeterWi. All rights reserved.
//

import SwiftUI

struct InCategoryView: View {
        @EnvironmentObject var env : GlobalEnvironment
        @Environment(\.managedObjectContext) var moc
        @FetchRequest(entity: Cloth.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Cloth.id, ascending: true)
            ]
        ) var clothes: FetchedResults<Cloth>
        
        @State var showAddSheet = false
        @State var showEditAction = false
        @State var showEdit = false
        @State var showAlert = false
        
        @State var inClothType: String
        @State var image: Data = .init(count: 0)
        @State var editCloth: Cloth?
        
        
        var body: some View {
            NavigationView {
                VStack(alignment: .leading) {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach (env.clothColors.sorted(), id: \.self) { clothColor in
                            VStack(alignment: .leading) {
                                if (!self.clothes.filter({clothColor == $0.color! && self.inClothType == $0.type!}).isEmpty) {
                                    Text(clothColor)
                                        .font(.headline)
                                        .padding(.leading, 15)
                                        .padding(.top, 5)
                                }
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(alignment: .top, spacing: 0) {
                                        ForEach (self.clothes.filter({ clothColor == $0.color! && self.inClothType == $0.type! }), id: \.self) { cloth in
                                            VStack {
                                                Button(action: {
                                                    self.showEditAction.toggle()
                                                    self.editCloth = cloth
                                                } ) {
                                                    Image(uiImage: UIImage(data: cloth.imageD ?? self.image)!)
                                                        .renderingMode(.original)
                                                        .resizable()
                                                        .frame(maxWidth: 155, maxHeight: 155)
                                                        .cornerRadius(5)
                                                }
                                                .sheet(isPresented: self.$showEdit) {
                                                    EditClothView(cloth: self.editCloth!)
                                                        .environmentObject(GlobalEnvironment())
                                                        .environment(\.managedObjectContext, self.moc)
                                                }
                                                HStack {
                                                    Text("\(cloth.color ?? "") \(cloth.type ?? "")")
                                                    Spacer()
                                                    Button(action: {
                                                        cloth.favo.toggle()
                                                        try? self.moc.save()
                                                    }) {
                                                    Image(systemName: cloth.favo ? "heart.fill": "heart")
                                                    }
                                                }
                                            }
                                        }.padding()
                                        
                                    } // end of ForEach
                                } // end of ScrollView
                                //.frame(height: 185)
                            }
                        }
                    }
                    // .navigationBarTitle("Color", displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        self.showAddSheet.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                    }
                        .sheet(isPresented: self.$showAddSheet) {
                            AddClothView()
                                .environment(\.managedObjectContext, self.moc)
                                .environmentObject(GlobalEnvironment())
                        }
                    )
                }
            }
            .actionSheet(isPresented: self.$showEditAction) {
                ActionSheet(title: Text("Select Options"), buttons: [
                    .default(Text("Edit")) {
                        self.showEdit.toggle()
                    },
                    .destructive(Text("Delete")) {
                        self.showAlert.toggle()
                    },
                    .cancel({ self.editCloth = Cloth.init() })
                ])
            }
            .alert(isPresented: self.$showAlert) {
                Alert(
                    title: Text("Are you sure to delete the item?"),
                    primaryButton: .destructive(Text("Yes"), action: { self.deleteCloth() }),
                    secondaryButton: .cancel(Text("No"))
                )
            }
        }
        
        func deleteCloth() {
            let dCloth = self.editCloth!
            self.moc.delete(dCloth)
            try? self.moc.save()
        }
}
