import UIKit

import Foundation

//while true {
//    print("Kerja...")
//    Thread.sleep(forTimeInterval: 1)
//}

var counter = 0

while true {
    print("Kerja...")
    counter += 1

    if counter == 10 {
        print("Istirahat Dulu Kawan, Billiard Dulu juga boleh")
        break
    }

    Thread.sleep(forTimeInterval: 1)
}
