//
//  ContentView.swift
//  week8_presentation
//
//  Created by Poter Pan on 2022/12/5.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isLogin: Bool = false
    @State var isWrong = false
    @State var showSheet = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .opacity(0.4)
                    .ignoresSafeArea()
                
                VStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 50))
                    HStack {
                        Image(systemName: "person.circle")
                        TextField("Account",text: $username)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    
                    HStack{
                        Image(systemName: "wallet.pass")
                            .font(.system(size: 20))
                        SecureField("Password",text: $password)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    
                    NavigationLink(destination: UserView(username: username), isActive: $isLogin, label: {
                        Button {
                            if username == "Apple" && password == "1234" {
                                isLogin  = true
                            }
                            else if username == "FCU" && password == "1234" {
                                showSheet = true
                            }
                            else {
                                isWrong = true
                            }
                        } label: {
                            Text("Login")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                    })
                    
                }
                .padding()
                .sheet(isPresented: $showSheet){
                    AdminView(username: $username)
                }
                .alert(isPresented: $isWrong){
                    Alert(title: Text("Error"), message: Text("帳號或密碼錯誤"), dismissButton: .destructive(Text("Confirm")))
                }
            }
        }
    }
}

struct UserView: View {
    var username: String
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Text("Welcome \(username) ")
                .font(.title)
        }
    }
}

struct AdminView: View {
    @Binding var username: String
    var body: some View {
        ZStack {
            Color.red
                .opacity(0.7)
                .ignoresSafeArea()
                
            VStack {
                Text("Admin: \(username) ")
                    .font(.title)
                Text("Logged in")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


