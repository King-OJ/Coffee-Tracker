//
//  ContentView.swift
//  Coffee Tracker
//
//  Created by Clem OJ on 14/09/2023.
//

import SwiftUI

struct MainView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var records: FetchedResults<Coffee>
    
    @State private var showAddCoffeeView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(records) {record in
                        CoffeeDetail(amount: String(record.amount), coffee: record.type!, date: record.date!)
                            .swipeActions(edge: .leading) {
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.white)
                                }.tint(.red)
                                
                            }
                    }
                }.scrollContentBackground(.hidden)
                
                
                Spacer()
               
            }
            .sheet(isPresented: $showAddCoffeeView, content: {
                AddCoffeeView()
            })
            .navigationTitle("Coffee Records")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddCoffeeView = true
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                            .foregroundColor(.blue)
                    }

                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
