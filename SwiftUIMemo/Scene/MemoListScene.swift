//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by 강민석 on 2020/05/10.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import SwiftUI

struct MemoListScene: View {
    @EnvironmentObject var store: CoreDataManager
    
    @State var showComposer: Bool = false
    
    @FetchRequest(entity: MemoEntity.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \MemoEntity.insertDate, ascending: false)])
    var memoList: FetchedResults<MemoEntity>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(memoList) { memo in
                    NavigationLink(
                        destination: DetailScene(memo: memo),
                        label: {
                            MemoCell(memo: memo)
                        })
                }
                .onDelete(perform: { indexSet in
                    delete(set: indexSet)
                })
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
    
    func delete(set: IndexSet) {
        for index in set {
            store.delete(memo: memoList[index])
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
            .environmentObject(CoreDataManager.shared)
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
