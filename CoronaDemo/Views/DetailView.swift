//
//  DetailView.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//

import SwiftUI
struct DetailView: View {
    @ObservedObject var detailVM = DetailViewModel()
    var title  : String
    var body: some View {
        
        ZStack{
            Color(hex: "465172").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 11.0){
                Text("Quick Facts").font(Font.system(size: 65)).bold().foregroundColor(Color(hex: "DFDFEE")).font(Font.system(size: 55))
                Spacer()
                Text("\(self.detailVM.detailObject?.cases?.total ?? 0)").font(Font.system(size: 70)).bold().foregroundColor(Color(hex: "85DBA1"))
                
                Text("Total Confirmed Cases").font(.largeTitle).bold().foregroundColor(Color(hex: "DFDFEE"))
                Spacer()
                
                Text("\(self.detailVM.detailObject?.deaths?.total ?? 0)").font(Font.system(size: 70)).bold().foregroundColor(Color(hex: "E15D67"))
                
                Text("Total Deceased").font(.largeTitle).bold().foregroundColor(Color(hex: "DFDFEE"))
                Spacer()
                Text("\(self.detailVM.detailObject?.cases?.recovered ?? 0)").font(Font.system(size: 70)).bold().foregroundColor(Color(hex: "5C99DC"))
                
                Text("Total Recovered").font(.largeTitle).bold().foregroundColor(Color(hex: "DFDFEE"))
                
            }
            .padding()
        }.navigationBarTitle(self.title).onAppear( perform: self.call ).alert(isPresented: self.$detailVM.isEnabled, content: {Helper.shared.showAlert()})
        
    }
    private func call() {
        self.detailVM.createRequest(urlString : UrlEnum.detailUrl+self.title)
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Subtitle")
    }
}
