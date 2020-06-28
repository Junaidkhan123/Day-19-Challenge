//
//  ContentView.swift
//  First-iOS14 app
//
//  Created by Jhon Khan on 27/06/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var inputUnit = 0
    @State private var outputUnits = 0
    let inputUnits = ["Day", "Hours", "Minutes", "Seconds"]
    
    var convertedValue: Double {
        let value        = Double(name) ?? 0.0
        if inputUnit == 0 {
            if outputUnits == 1 {
                return 24  * value
            }
            else if outputUnits == 0 {
                return value
            }
            else if outputUnits ==  2 {
                return 24 * 60  * value
            }
            else {
                return 24 * 60 * 60  * value
            }
        }
        else if inputUnit == 1 {
            if outputUnits == 1 {
                return value
            }
            else if outputUnits == 0 {
                return value / 24
            }
            else if outputUnits ==  2 {
                return 60  * value
            }
            else {
                return 60 * 60  * value
            }
        }

        return 0.0
    }
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Enter Value", text: $name)
                }
                
                Section(header: Text("Choose Input Unit")){
                    Picker("Units", selection: $inputUnit) {
                        ForEach(0..<inputUnits.count){ eachUnit in
                            Text("\(inputUnits[eachUnit])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Choose Output Unit")){
                    Picker("Units", selection: $outputUnits) {
                        ForEach(0..<inputUnits.count){ eachUnit in
                            Text("\(inputUnits[eachUnit])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Value")) {
                    Text("\(convertedValue, specifier: "%.2f")")
                }

            }
            .navigationBarTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
