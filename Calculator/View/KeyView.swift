//
//  KeyView.swift
//  Calculator
//
//  Created by english on 2024-09-23.
//

import SwiftUI

struct KeyView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var changeColor = false
    let buttons : [[Keys]] = [
        [.clear, .negetive, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    var body: some View {
        VStack{
            
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(changeColor ? Color.num:Color.pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor)
                    .onAppear(perform: {
                        self.changeColor.toggle()
                    })
                    .overlay(
                        Text(value)
                            .font(.system(size: 100))
                            .foregroundStyle(.black)
                    )
            }.padding()
            ForEach(buttons, id: \.self){
                row in
                HStack(spacing: 12){
                    ForEach(row, id: \.self){
                        element in
                        Button(action: {
                            print("\(element.rawValue) tapped!")
                        }, label: {
                            Text(element.rawValue)
                                .font(.system(size: 30))
                                .frame(
                                    width: 80, height: 60
                                )
                                .background(element.buttonColor)
                                .foregroundStyle(.black)
                                .clipShape(RoundedRectangle(cornerRadius : 20))
                                .shadow(color: .purple.opacity(0.5), radius: 30)
                        })
                    }
                }.padding(.bottom, 4)
            }
        }
    }
    
    func getWidth(element: Keys) -> CGFloat{
        if element == .zero {
            return (UIScreen.main.bounds.width - (5*10))/2
        }
        return (UIScreen.main.bounds.width - (5*4)) / 4
    }
    
    func getHeight(elements : Keys) -> CGFloat{
        return (UIScreen.main.bounds.width - (5*10)) / 5
    }
    
    func didTap (button : Keys){
        switch button{
        case .add, .substract, .multiply, .divide, .equal:
            if button == .add{
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .substract{
                self.currentOperation = .subscrapt
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .multiply{
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .divide{
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            if button == .equal{
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .subscrapt:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break              }
            }
            if button != .equal{
                self.value = "0"
            }
            
        case .clear:
            self.value = "0"
        case .decimal, .negetive, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }else {
                self.value = "\(self.value)\(number)"
            }
            
        }
    }
}
    
#Preview {
    KeyView()
}
