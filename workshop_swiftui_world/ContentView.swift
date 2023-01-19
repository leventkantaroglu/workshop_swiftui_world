//
//  ContentView.swift
//  workshop_swiftui_world
//
//  Created by Levent Kantaroğlu on 17.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var fValue: String = "0"

    @State var isVisible = false

    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()

    func convertToCelcius() -> String {
        if let value = Double(fValue) {
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            let cValue = fahrenheit.converted(to: .celsius)
            return numberFormatter.string(from: NSNumber(value: cValue.value)) ?? "???"
        }
        else {
            return "???"
        }
    }

    var body: some View {
        VStack {
            Spacer()
            TextField("conversion_text_field_placeholder", text: $fValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64))
                .multilineTextAlignment(.center)
            Text("F")
            Text("converesion_is_actually")
                .foregroundColor(.gray)
            Text(convertToCelcius())
                .font(Font.system(size: 64))
            Text("C")
            Spacer()
        }
        .foregroundColor(.brown)
        .font(.title)
        .opacity(isVisible ? 1.0 : 0.0)
        // .offset(x: 0, y: isVisible ? 0.0 : 100.0)
        .animation(.easeIn(duration: 2.0), value: self.isVisible)
        .onAppear {
            self.isVisible = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
