//
//  IMCResult.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 01/09/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight: Double
    let userHeight: Double
    var body: some View {
        
        VStack{
            Text("Tu resultado").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundStyle(Color.white)
            let result = calculateImc(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundApp)
    }
}

func calculateImc(weight: Double, height: Double) -> Double {
    let result = weight/((height/100)*(height/100))
    return result
}

struct InformationView: View {
    let result: Double
    var body: some View {
        let information = getImcResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundStyle(information.2).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            Spacer()
            Text("\(result, specifier: "%.2f")").foregroundStyle(Color.white).font(.system(size: 80)).bold()
            Spacer()
            Text(information.1).foregroundStyle(Color.white).font(.title2).padding(.horizontal, 8)
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16).padding(16)
    }
}

func getImcResult(result: Double) -> (String, String, Color){
    let title: String
    let description: String
    let color: Color
    
    switch result{
    case 0.00..<20:
        title = "Peso bajo"
        description = "Estás por debajo del peso recomendado segun el IMC"
        color = Color.yellow
    case 20.00..<25:
        title = "Peso normal"
        description = "Estas en el peso recomendado segun el IMC"
        color = Color.green
    case 25.00..<30:
        title = "Sobrepeso"
        description = "Estas por encima del peso recomendado segun el IMC"
        color = Color.orange
    case 30.00..<100:
        title = "Obesidad"
        description = "Estas muy por encima del peso recomendado segun el IMC"
        color = Color.red
    default:
        title = "ERROR"
        description = "Ha ocurrido un error"
        color = Color.red
    }
    
    return (title, description, color)
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
