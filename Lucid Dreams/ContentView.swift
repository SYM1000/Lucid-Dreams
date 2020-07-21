//
//  ContentView.swift
//  Lucid Dreams
//
//  Created by Santiago Yeomans on 18/07/20.
//  Copyright © 2020 Santiago Yeomans. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    
    @State var index = 0
    @State var show = false
    
    var body: some View{
        
        ZStack{
            //Menu
            HStack{
                VStack(alignment: .leading, spacing: 12){
                    
                    Image("avatar") //Foto de perfil del usuario
                    
                    Text("Hi,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Text("Santiago") //Nombre del usuario
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    //Boton 0 del Menu
                    Button(action: {
                        
                        self.index = 0
                        
                        //Animatin Views...
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }){
                        
                        HStack(spacing: 25){
                            Image("catalouge")
                            .foregroundColor(self.index == 0 ? Color("Color1") : Color.white)
                            
                            Text("Dreams")
                            .foregroundColor(self.index == 0 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top, 25)
                    
                    //Boton 1 del Menu
                    Button(action: {
                        
                        self.index = 1
                        
                        //Animatin Views...
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }){
                        
                        HStack(spacing: 25){
                            Image("cart")
                            .foregroundColor(self.index == 1 ? Color("Color1") : Color.white)
                            
                            Text("Cart")
                            .foregroundColor(self.index == 1 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    //Boton 2 del Menu
                    Button(action: {
                        
                        self.index = 2
                        
                        //Animatin Views...
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }){
                        
                        HStack(spacing: 25){
                            Image("fav")
                            .foregroundColor(self.index == 2 ? Color("Color1") : Color.white)
                            
                            Text("Favourites")
                            .foregroundColor(self.index == 2 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    //Boton 3 del Menu
                    Button(action: {
                        
                        self.index = 3
                        
                        //Animatin Views...
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }){
                        
                        HStack(spacing: 25){
                            Image("orders")
                            .foregroundColor(self.index == 3 ? Color("Color1") : Color.white)
                            
                            Text("Your orders")
                            .foregroundColor(self.index == 3 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width:150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    
                    //Boton Cerrar Sesión
                    Button(action: {
                        
                        //Cerrar sesion
                        
                    }){
                        
                        HStack(spacing: 25){
                            Image("out")
                            .foregroundColor(Color.white)
                            
                            Text("Sign Out")
                            .foregroundColor(Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                    
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
            .padding(.top, UIApplication.shared.windows.first? .safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first? .safeAreaInsets.bottom)
            
            //Main view -> Vista principal
            VStack(spacing: 0){
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        //Animatin Views...
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }){
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    
                    //Cambiar el nombre basado en el Index
                    Text(self.index == 0 ? "Dreams" :  self.index == 1 ? "Cart" : (self.index == 2 ? "Favourites" : "Orders"))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader{_ in
                    
                    VStack{
                        //Cambiar vista basado en el numero del index
                        if self.index == 0{
                            MainPage()
                        }else if self.index == 1{
                            Cart()
                        }else if self.index == 2{
                            Fav()
                        }else{
                            Orders()
                        }
                        
                    }
                    
                }
            }
            .background(Color.white)
            //Aplicar radio en las esquinas
                .cornerRadius(self.show ? 30 :0 )
                
                
                
            //Mover la vista cuando se precione el boton de menu
                .scaleEffect(self.show ? 0.9 : 1)
                .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            //Rotar un poco
                .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}


//Main Page View
struct MainPage : View {
    
    var body: some View{
        VStack{
            Text("Producto")
        }
    }
    
}

//Cart View
struct Cart : View {
    
    var body: some View{
        VStack{
            Text("Cart")
        }
    }
    
}

//Orders View
struct Orders : View {
    
    var body: some View{
        VStack{
            Text("Orders")
        }
    }
    
}

//Favourites View
struct Fav : View {
    
    var body: some View{
        VStack{
            Text("Favourties")
        }
    }
    
}
