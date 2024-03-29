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

let longText = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

struct View_Text: View {
    var body: some View {
        VStack {
            // 자동으로 LocalizedStringKey를 검색하여 매칭
            //Text("Hello, World!")
            
            // 수동으로LocalizedStringKey를 입력
            //Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, tableName: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Table Name@*/nil/*@END_MENU_TOKEN@*/, bundle: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Bundle@*/nil/*@END_MENU_TOKEN@*/, comment: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Comment@*/nil/*@END_MENU_TOKEN@*/)
            
            // LocalizedStringKey를 찾지 않음
            //Text(verbatim: /*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
            
            Text("Hello, World!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.black)
            
            Text(longText)
                .frame(width: 300)
                .lineLimit(7)
                .truncationMode(.tail) // 생략할 위치 (...)
                .multilineTextAlignment(.center) // text 정렬
                .lineSpacing(5) // 열간 거리
            
            Text("Lorem ipsum dolor sit amet, consectetur")
                .font(.largeTitle)
                .frame(width: 300)
                .lineLimit(1) // 열 제한
                .allowsTightening(true) // 자간
                .minimumScaleFactor(0.5) // 사이즈
        }
    }
}

struct View_Text_Previews: PreviewProvider {
    static var previews: some View {
        View_Text()
    }
}
