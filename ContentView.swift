//
//  ContentView.swift
//  CovidApp2
//
//  Created by 18556 on 7/7/21.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        
        /*LaunchScreen(imageSize: CGSize(width: 128, height: 128)) {
            
                DashboardView()
            
        } logoView: {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)

        }*/
        
        DashboardView()
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}


