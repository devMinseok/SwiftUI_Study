//
//  Mastering SwiftUI
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SwiftUI

struct SingleSelection: View {
    var items = AppleProduct.sampleList
    
    @State private var selected: AppleProduct? = nil
    
    var body: some View {
        VStack {
            Text("Managing Selection")
                .font(.largeTitle)
            
            Text("Selected: \(selected?.name ?? "-")")
                .font(.title)
            
            // 편집 모드에서는 selection 파라미터를 통해 State 변수를 Binding 함
            // List가 인스턴스를 구분하기 위해 사용하는 형식과 State 변수의 형식이 일치해야함
            // 위의 조건이 만족한다면 편집모드에서 선택한 항목을 자동으로 Binding 함
            List(items, id: \.self, selection: $selected) { item in
                Button(action: {
                    // 일반 모드에서 단일모드를 처리할때는 State 변수에 선택한 항목을 직접 저장
                    // 이 때는 List에서 selection 파라미터를 사용할 필요 없음
                    self.selected = item
                }, label: {
                    Text(item.name)
                })
            }
        }
        .navigationBarItems(trailing: EditButton())
    }
}

struct ManagingSelection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SingleSelection()
        }
    }
}
