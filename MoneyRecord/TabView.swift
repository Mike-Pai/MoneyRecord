//
//  TabView.swift
//  MoneyRecord
//
//  Created by 白謹瑜 on 2020/12/7.
//

import SwiftUI

struct TabShowView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("名言製作")
                }
            SantenceView()
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("名言語錄")
                }
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabShowView()
    }
}
