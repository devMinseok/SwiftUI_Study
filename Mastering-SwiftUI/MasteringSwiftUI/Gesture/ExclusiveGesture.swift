//a
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

enum GestureType {
    case rotation
    case magnification
}

struct Gesture_ExclusiveGesture: View {
    @ObservedObject var rotation = Rotation()
    @ObservedObject var magnification = Magnification()
    @State private var currentGestureType = GestureType.rotation
    
    var gestures: some Gesture {
        ExclusiveGesture(rotation.gesture, magnification.gesture)
    }
    
    var body: some View {
        VStack {
            VStack {
                if currentGestureType == .rotation {
                    SwiftUILogo()
                        .rotationEffect(rotation.finalAngle)
                        .scaleEffect(magnification.finalScale)
                        .gesture(gestures)
                } else {
                    SwiftUILogo()
                        .rotationEffect(rotation.finalAngle)
                        .scaleEffect(magnification.finalScale)
                        .gesture(magnification.gesture.exclusively(before: rotation.gesture))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ExclusiveGestureMenu(currentGestureType: $currentGestureType)
        }
    }
}

struct Gesture_ExclusiveGesture_Previews: PreviewProvider {
    static var previews: some View {
        Gesture_ExclusiveGesture()
    }
}



