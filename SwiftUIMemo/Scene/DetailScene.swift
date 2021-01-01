//
//  DetailScene.swift
//  SwiftUIMemo
//
//  Created by 강민석 on 2021/01/01.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

import SwiftUI

struct DetailScene: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(self.memo.content)
                            .padding()
                        
                        Spacer()
                    }
                    
                    Text("\(self.memo.insertDate, formatter: formatter)")
                        .padding()
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
        }
        .navigationBarTitle("메모 상세")
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(memo: Memo(content: "Test"))
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
