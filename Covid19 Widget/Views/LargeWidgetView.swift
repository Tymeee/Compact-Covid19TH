//
//  MediumWidgetView.swift
//  MediumWidgetView
//
//  Created by E2318556 on 3/8/2564 BE.
//

import SwiftUI
import WidgetKit

struct LargeWidgetView: View{
    let data: Model
    
    
    var body: some View{
        if #available(iOS 15.0, *) {
            VStack(spacing: 0){
                
                Text("\(data.covidData.UpdateDate)")
                    .font(.system(size: 10))
                    .frame(height: 30)
                
                VStack(spacing: 0){
                    HStack(spacing:0){
                        
                        //Confirmed
                        Rectangle()
                            .foregroundColor(Color(red: 229/255, green: 56/255, blue: 59/255))
                            .overlay{
                                VStack(){
                                    Text("ติดเชื้อ")
                                    
                                    Text("\(data.covidData.Confirmed)")
                                        .fontWeight(.bold)
                                    
                                    Text("(+ \(data.covidData.NewConfirmed))")
                                        .font(.footnote)
                                        
                                }.font(.system(size: 18))
                            }
                        
                        //Recovered
                        Rectangle()
                            .foregroundColor(Color(red: 0/255, green: 127/255, blue: 95/255))
                            .overlay{
                                VStack{
                                    Text("รักษาอยู่")
                                        
                                    Text("\(data.covidData.Hospitalized)")
                                        .fontWeight(.bold)
                                    
                                    Text("(+ \(data.covidData.NewHospitalized))")
                                        .font(.footnote)
                                        
                                }.font(.system(size: 18))
                            }
                    }
                    
   
                    HStack(spacing: 0){
                       
                        //Hospitalized
                        Rectangle()
                            .foregroundColor(Color(red: 256/255, green: 172/255, blue: 60/255))
                            .overlay{
                                VStack(){
                                    Text("หายแล้ว")
                                        
                                    Text("\(data.covidData.Recovered)")
                                        .fontWeight(.bold)
                                    
                                    Text("(+ \(data.covidData.NewRecovered))")
                                        .font(.footnote)
                                    
                                }.font(.system(size: 18))
                            }
                        
                        //Death
                        Rectangle()
                            .foregroundColor(Color(red: 52/255, green: 58/255, blue: 64/255))
                            .overlay{
                                VStack(){
                                    Text("เสียชีวิต")
                                        
                                    Text("\(data.covidData.Deaths)")
                                        .fontWeight(.bold)
                                    
                                    Text("(+ \(data.covidData.NewDeaths))")
                                        .font(.footnote)
                                    
                                }.font(.system(size: 18))
                            }
                    }
                }.foregroundColor(Color.white)
                    .font(.system(size: 13))
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}

struct Covid19_Widget5_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            Covid19_Widget5EntryView(data: Model(date: Date(),covidData: CovidData(Confirmed: 0, Recovered: 0, Hospitalized: 0, Deaths: 0, NewConfirmed: 0, NewRecovered: 0, active: 0, NewDeaths: 0, NewHospitalized: 0, UpdateDate: "")))
                .previewDevice("iPhone 12 Pro")
                .previewContext(WidgetPreviewContext(family: .systemLarge))
.previewInterfaceOrientation(.portrait)
            
            
        }
    }
}

