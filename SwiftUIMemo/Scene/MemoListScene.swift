//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by 강민석 on 2020/05/10.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import SwiftUI

struct MemoListScene: View {
    @EnvironmentObject var store: MemoStore
    
    @State var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .navigationBarTitle("내 메모")
            .navigationBarItems(trailing: ModalButton(show: $showComposer))
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: $showComposer)
                    .environmentObject(self.store)
                    .environmentObject(KeyboardObserver())
            })
        }
    }
}

fileprivate struct ModalButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
