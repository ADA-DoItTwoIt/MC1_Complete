import SwiftUI

struct ContentView: View {
    @State private var orientation = UIDevice.current.orientation
    
    var body: some View {
        VStack {
//            if orientation.isLandscape {
                NavigationView {
                    FirstHalfView2()
                }
                .navigationViewStyle(.stack)
//            } else {
//                Text("디바이스를 가로모드로 사용해주세요 :)")
//            }
        }
//        .detectOrientation($orientation)
    }
}
