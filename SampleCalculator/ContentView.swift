//
//  ContentView.swift
//  SampleCalculator
//
//  Created by Makoto on 2021/11/30.
//

import SwiftUI

struct ContentView: View {
    
    private let caluculateItems: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "+"],
        ["1", "2", "3", "-"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                   Spacer()
                    Text("0")
                        .font(.system(size: 100, weight: .light))
                        .foregroundColor(Color.white)
                        .padding()
                }
                
                VStack {
                    
                    ForEach(caluculateItems, id: \.self) { items in
                        NumberView(items: items)
                    }
                }
            }
            .padding(.bottom, 40)
        }
    }
}

struct NumberView: View {
    
    var items: [String]
    private let numbers: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "."]
    private let symbols: [String] = ["÷", "×", "+", "-", "="]
    private let buttonWidth: CGFloat = (UIScreen.main.bounds.width - 50) / 4
    
    var body: some View {
        
        HStack {
            
            ForEach(items, id: \.self) { item in
                Button {
                    
                } label: {
                    
                    Text(item)
                        .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity)
                        .font(.system(size: 30, weight: .regular))
                }
                .foregroundColor(numbers.contains(item) || symbols.contains(item) ? .white : .black)
                .background(handleButtonColor(item: item))
                .frame(width: item == "0" ? buttonWidth * 2 + 10 : buttonWidth)
                .cornerRadius(buttonWidth)
            }
            .frame(height: buttonWidth)
        }
    }
    
    private func handleButtonColor(item: String) -> Color {
        
        if numbers.contains(item) {
            return Color(white: 0.4, opacity: 1)
        } else if symbols.contains(item) {
            return Color.orange
        } else {
            return Color(white: 0.9, opacity: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
