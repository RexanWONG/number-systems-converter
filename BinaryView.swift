//
//  BinaryView2.swift
//  Number Systems
//
//  Created by Rexan Wong on 1/12/2022.
//

import SwiftUI
import Darwin

struct BinaryView: View {
    @State var binaryInput: String = ""
    @State var buttonCount: Int = 0
    @State var zero: Int = 0
    
    //convert from binary to decimal number
    func binaryToDecimal(binaryInput: Int) -> Int {
        let num = binaryInput;
        
        // Set base value to 1, ex. 2^0
        var base = 1
        
        //variable to store the extracted digits of a given binary number starting from the rightmost digit
        var decimal = 0
     
        var temp = num;
        while ((temp) != 0) {
            let lastDigit = temp % 10;
            temp = (temp/10)
     
            //multiply the digit with the proper base (Power of 2) and add it to the variable decimal
            decimal += lastDigit * base;
     
            base = base * 2;
            
        }
        
     
        return decimal
    }
    
    func binaryToHexadecimal(binaryInput: String) -> String {
        if let Input = Int(binaryInput, radix: 2) {
            let Hexadecimal = String(Input, radix: 16)
            return Hexadecimal
        }
        return "0"
    }
        
    
    
    
    

    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Enter Binary Number")
                    .font(.largeTitle)
                
                TextField("Enter binary number", text: $binaryInput)
                    .padding(20)
                    .frame(width: 200, height: 40)
                    .overlay(Capsule().strokeBorder(.gray))
                    .keyboardType(.numberPad)
                
                Spacer()
                
                Text("Decimal : \(binaryToDecimal(binaryInput: Int(binaryInput) ?? 0))")
                    .font(.largeTitle)
                Text("Hexadecimal : \(binaryToHexadecimal(binaryInput: binaryInput))")
                    .font(.largeTitle)
                    .padding(.bottom)
            }
            .navigationTitle("Binary Conversion")
            
        }
        
       
        
    }
}

struct BinaryView_Previews: PreviewProvider {
    static var previews: some View {
        BinaryView()
    }
}
