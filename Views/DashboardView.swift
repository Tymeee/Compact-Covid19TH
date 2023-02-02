//
//  DashboardView.swift
//  CovidApp2
//
//  Created by 18556 on 7/9/21.
//

import SwiftUI

struct DashboardView: View {
        
    @State private var covidData: CovidData?
   
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
        NavigationView{
            List(){
                StatsView()
                    .listRowBackground(Color.clear)
                
                
                Section(header:
                            Text("ยอดติดเชื้อต่ออาทิตย์")
                ){
                    
                    ProvinceCase()
                }.headerProminence(.increased)
                
                Section(header:
                            Text("ยอดเสียชีวิตต่ออาทิตย์")
                ){
                    ProvinceDeath()
                }.headerProminence(.increased)
                 
                
                Section(header:
                            Text("รวมเบอร์สายด่วน")
                ){
                    PhoneBox()
                    
                }.headerProminence(.increased)
                 
                 
            }
            .onAppear {
                loadData()
            }
            .navigationBarTitle("Dashboard")
            
            
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    
                    HStack(spacing: -10){
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                        
                        Text("Update:\(covidData?.UpdateDate ?? "")")
                            .font(.caption)
                            .padding(.trailing)
                        
                        Button(action:{
                            loadData()
                        }, label:{
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(Color?(Color(red: 229/255, green: 56/255, blue: 59/255)))
                        })
                    }
                }
            }
            
            .refreshable {
                loadData()
            }
            
        }
    }
    
    
    //Fetch JSON data from URL
    public func loadData() {
        guard let url = URL(string: "https://static.easysunday.com/covid-19/getTodayCases.json") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(CovidData.self, from: data){
                DispatchQueue.main.async {
                    self.covidData = decodedData
                }
            }
        }.resume()
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
