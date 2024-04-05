//
//  LoginView.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 4/4/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var credentialsAreShown = false
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var accountsVM = AccountListViewModel()
    
    var body: some View {
        VStack {
            Button(action: {credentialsAreShown.toggle()}, label: {
                Text("Show user and password")
            }).sheet(isPresented: $credentialsAreShown, content: {
                VStack {
                    HStack(spacing: 0){
                        Text("User: ").font(.title)
                        Text(" Manolito").font(.largeTitle)
                    }
                    HStack(spacing: 0){
                        Text("password: ").font(.title)
                        Text(" Gafotas").font(.largeTitle)
                    }
                    
                }
            })
            Form {
                HStack {
                    Spacer()
                    Text(loginVM.loggedUsername.isEmpty ? "Not logged" : "Welcome \(loginVM.loggedUsername)!")
                    Image(systemName: loginVM.loggedUsername.isEmpty ? "lock.fill" : "lock.open.fill")
                }
                TextField("Username", text: $loginVM.userName)
                TextField("Password", text: $loginVM.password)
                HStack {
                    Spacer()
                    Button("Login") {
                        loginVM.login()
                    }
                    Spacer()
                    Button("Signout") {
                        
                    }
                    Spacer()
                }
            }.buttonStyle(BorderedButtonStyle())
                .frame(maxHeight: 250)
            VStack {
                Spacer()
                if loginVM.loggedUsername.isEmpty {
                    Text("Login to see your accounts!")
                } else {
                    if accountsVM.accounts.isEmpty {
                        Text("You have no accounts")
                    } else {
                        List(accountsVM.accounts, id: \.id) { account in
                            HStack {
                                Text("\(account.name)")
                                Spacer()
                                Text(String(format: "$%.2f", account.balance))
                            }
                        }.listStyle(.plain)
                    }
                        
                }
                Spacer()
                Button("Get Accounts") {
                    accountsVM.getAllAccounts()
                }
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
#Preview {
    LoginView()
}
