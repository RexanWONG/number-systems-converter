//
//  DecimalView.swift
//  Number Systems
//
//  Created by Rexan Wong on 29/11/2022.
//

import SwiftUI

struct DecimalView: View {
    @State var decimal: String = ""
    
    func decimalToBinary(decimalInput: Int) -> String {
        var binary = ""
        var binaryDigitsArray: [Int] = []
        
        var temp = decimalInput
        
        
        
        while temp >= 1 {
            binaryDigitsArray.append(temp % 2)
            temp /= 2
        }
        
        binaryDigitsArray.reverse()
        
        for digits in binaryDigitsArray {
            binary = binary + String(digits)
        }
        
        return binary
    }
    
    
    
    var convertHexadecimal: String {
        let hexadecimalInput = Int(decimal) ?? 0
        let hexadecimal = String(hexadecimalInput, radix: 16)
        return hexadecimal
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Enter Decimal Number")
                    .font(.largeTitle)
                
                
                TextField("Enter decimal number", text: $decimal)
                    .padding(20)
                    .frame(width: 200, height: 40)
                    .overlay(Capsule().strokeBorder(.gray))
                    .keyboardType(.numberPad)
                
                Spacer()
                
                Text("Binary : \(decimalToBinary(decimalInput: Int(decimal) ?? 0))")
                    .font(.largeTitle)
                
                Text("Hexadecimal : \(convertHexadecimal)")
                    .font(.largeTitle)
                    .padding(.bottom)
                
            }
            .navigationTitle("Decimal Conversion")
        }
    }
}

struct DecimalView_Previews: PreviewProvider {
    static var previews: some View {
        DecimalView()
    }
}
