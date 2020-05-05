//
//  ContentView.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 3/16/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   

    
    init() {

        UINavigationBar.appearance().barTintColor = .init(red: 0/256, green: 147/256, blue: 154/256, alpha: 1.0)

        // To change colour of tappable items.
        UINavigationBar.appearance().tintColor = .white

        // To apply textAttributes to title i.e. colour, font etc.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
        // To control navigation bar's translucency.
        // To control navigation bar's translucency.
        UINavigationBar.appearance().isTranslucent = false

    }

    @State var showMenu = false
    
  var body: some View {
    
        
        let drag = DragGesture()
            .onEnded{
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
                
        }
        
        return NavigationView{
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                MainView(showMenu: self.$showMenu)
                .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2 :0 )
                    .disabled(self.showMenu ? true :false)
                if self.showMenu{
                    MenuView()
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .leading))
                }
            }
                
                
                
        .gesture(drag)
            }
        .navigationBarTitle( "Home")
        
        .navigationBarItems(leading: (
            Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large).foregroundColor(.white)
                
            }
        ))
            
        }
    }
    
   
    
    
}



struct MainView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View{
        
        ScrollView{
           
            VStack{
                 NavigationLink(destination: FoodTrackerView()){
                Button(action :{}){
                    Text("Meals")
                }
                .frame(width: 350, height: 200)
                .background(Color.white)
                .cornerRadius(15)
                .padding(29.0)
                .shadow(color: Color.gray, radius: 5)
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.title)
                Spacer()
            }
            }
            
            HStack{
                
                Button(action:{}){
                    Text("Activiy")
                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                        .font(.title)
                }
                .frame(width: 170, height: 200)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                
                
                Button(action:{}){
                    Text("Weight")
                        .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                        .font(.title)
                    
                    
                }
                .frame(width: 170, height: 200)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                
                
            }
            Spacer(minLength: 30)
            
            
            VStack{
                Button(action :{}){
                    Text("Medication")
                }
                .frame(width: 350, height: 200)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray, radius: 5)
                .foregroundColor(Color.init( red: 0/256, green: 147/256, blue: 154/256))
                .font(.title)
                
            }
            .frame(maxWidth: .infinity)
            
        }

        
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
    
 
}
