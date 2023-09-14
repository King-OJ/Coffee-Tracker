//
//  AddCoffeeView.swift
//  Coffee Tracker
//
//  Created by Clem OJ on 14/09/2023.
//

import SwiftUI

struct AddCoffeeView: View {
    
    @Environment (\.dismiss) var dismiss
    @Environment (\.managedObjectContext) var managedCoffeeContext
    
    @State private var amount: String = ""
    @State private var type: String = ""
    @State private var showError = false
    @State private var errorText = ""
    
    let coffeeTypes = ["Arabian", "Robusta", "Excelsa", "Liberica"]
    
    var body: some View {
        VStack(spacing: 25){
            
            VStack(alignment: .leading){
                Text("Add Coffee Intake")
                    .font(.title)
                    .bold()
                
                
                TextField("Amount", text: $amount)
                    .padding()
                    .background(.white)
                    .font(.headline)
                    .bold()
                    .cornerRadius(16)
                    .foregroundColor(.black)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
           
            Text("Coffee Type")
                .font(.headline)
            
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
                               ]) {
               ForEach(coffeeTypes, id: \.self) { coffee in
                   Button {
                       type = coffee
                   } label: {
                       Text(coffee)
                           .font(.subheadline)
                           .bold()
                           .padding(12)
                           .background(coffee == type ? .blue : .white)
                           .foregroundColor(coffee == type ? .white : .black)
                           .cornerRadius(10)
                           
                        }
                    }
                }
                .background(.white)
                .cornerRadius(16)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            if showError {
                Text(errorText)
                    .font(.subheadline)
                .foregroundColor(.red)
                
            }
            
            Button {
                let coffee = Coffee(context: managedCoffeeContext)
               
                if amount == "" || type == "" {
                   showError = true
                   errorText = "Please fill out all fields!"
               }
                else {
                    coffee.amount = Double(amount) ?? 0
                    coffee.id = UUID()
                    coffee.type = type
                    coffee.date = Date()
                    do {
                       try managedCoffeeContext.save()
                    }
                    catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError)")
                    }
                    dismiss()
                }
                
            } label: {
                RoundedRectangle(cornerRadius: 16)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .overlay{
                        Text("Add Record")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
            }

            
            Spacer()
            
        }.padding(.top, 30)
            .padding(.horizontal)
    }
}

struct AddCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeView()
    }
}
