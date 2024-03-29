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

struct Gesture_SequenceGesture: View {
    @ObservedObject var longPress = LongPress()
    @ObservedObject var drag = Drag()
    
    var sequence: some Gesture {
        SequenceGesture(longPress.gesture, drag.gesture)
            .onEnded { _ in
                self.longPress.activated = false
            }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Long Press")
                Image(systemName: "circle.fill")
                    .foregroundColor(longPress.activated ? Color.green : Color.gray)
                
                Text("Drag")
                Image(systemName: "circle.fill")
                    .foregroundColor(drag.activated ? Color.green : Color.gray)
            }
            .padding()
            
            VStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)
                    .offset(drag.currentTranslation)
                    .offset(drag.totalTranslation)
                    .gesture(sequence)
//                    .gesture(longPress.gesture.sequenced(before: drag.gesture).onEnded { _ in
//                        self.longPress.activated = false
//                    })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Gesture_SequenceGesture_Previews: PreviewProvider {
    static var previews: some View {
        Gesture_SequenceGesture()
    }
}
