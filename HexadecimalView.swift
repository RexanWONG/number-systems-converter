//
//  HexadecimalView.swift
//  Number Systems
//
//  Created by Rexan Wong on 29/11/2022.
//

import SwiftUI

struct HexadecimalView: View {
    @State private var hexadecimal: String = ""
    
    var convertDecimal: Int {
        if let decimal = Int(hexadecimal, radix: 16) {
            return decimal
        }
        return 0
    }
       
    var convertBinary: String {
        if let binary = Int(hexadecimal, radix: 16) {
            let binaryConversion = String(binary, radix: 2)
            return binaryConversion
        }
        return "0"
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Enter Hexadecimal Number")
                    .font(.largeTitle)
                
                
                TextField("Enter hexadecimal number", text: $hexadecimal)
                    .padding(20)
                    .frame(width: 200, height: 40)
                    .overlay(Capsule().strokeBorder(.gray))
                    .keyboardType(.numberPad)
                
                Spacer()
                
                Text("Binary : \(convertBinary)")
                    .font(.largeTitle)
                
                Text("Decimal : \(convertDecimal)")
                    .font(.largeTitle)
                    .padding(.bottom)
                
            }
            .navigationTitle("Hexadecimal Conversion")
        }
    }
}

struct HexadecimalView_Previews: PreviewProvider {
    static var previews: some View {
        HexadecimalView()
    }
}
