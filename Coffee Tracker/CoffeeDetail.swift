//
//  CoffeeDetail.swift
//  Coffee Tracker
//
//  Created by Clem OJ on 14/09/2023.
//

import SwiftUI

struct CoffeeDetail: View {
    var amount:String
    var coffee:String
    var date: Date
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .circular)
            .foregroundColor(.white)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .frame(width: 350, height: 70)
            .overlay(alignment:.leading ){
                HStack(alignment: .center, spacing: 30) {
                    Text(amount)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(coffee)
                            .bold()
                            .font(.headline)
                        Text(date, style: .date)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }.padding(.leading, 20)
            }
        
    }
}

struct CoffeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetail(amount: "44.0", coffee: "Excercise", date: Date())
    }
}
