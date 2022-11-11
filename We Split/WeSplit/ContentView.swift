//
//  ContentView.swift
//  WeSplit
//
//  Created by Nabeel on 08/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var totalBill = 0.0
    @State var numberOfPeople = 0
    @State var tipPercentage = 0
    @State var tipamount = 0.0
    @State var tips = [0,5,10,15,20]
    @FocusState var amountisFocused : Bool
    var totalTip : Double {
      
        var processedtip = totalBill*Double((tipPercentage))/100

        return processedtip
    }
    var totalPerPerson : Double {
       
        var peopleCount = Double(numberOfPeople + 2)
        var tipSelection = Double(tipPercentage)
        var finalPerPerson = (totalBill + totalTip)/peopleCount
        print(tipPercentage,totalTip)

        return Double(round(1000*finalPerPerson)/1000)
        
    }
    
    var body: some View {
        NavigationView {
            
                        
            Form {
               
                
                Section {
                    TextField("Amount", value: $totalBill, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .focused($amountisFocused)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Button("Done") {
                                    amountisFocused = false
                                }
                            }
                        }

                    
                }
                Section {
                    Text(totalBill, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                    
                    
                    Picker("No. of People", selection: $numberOfPeople){
                        ForEach(2..<100) {
                            Text("\($0) people ")
                        }
                        
                                         }
                }
                Section{
                    Text("\(totalBill + totalTip)")
                }
            header: {
                Text("Total Bill")
            }
                Section{
                    Text("How much tip do you want leave")
                    
                    Picker("Tip you want to give", selection: $tipPercentage){
                        ForEach(tips, id: \.self){
                            Text("\($0)")
                        }
                       
                        
                        
                    }
                    .pickerStyle(.segmented)
                    
                    Text(totalTip, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                 
                  
                }
            header: {
                Text("How much tip do you want leave")
            }

                .navigationTitle("We Split")
                Section{
                    Text("Each person have to give \(totalPerPerson)")
                }
            header: {
                Text("Amount Each person")
            }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
