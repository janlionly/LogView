//
//  ViewController.swift
//  LogViewDemo
//
//  Created by janlionly on 2021/9/29.
//

import UIKit
import LogView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            LogView.shared.makeVisible()
            LogView.shared.append(log: """
                                  LogView
                                  Version License Platform Swift

                                  Description
                                  LogView is a debugging tool view, you can put your interesting logs into view for showing, it support to pan for moving and show/hide using your two finger double tap.

                                  Installation
                                  CocoaPods
                                  pod 'LogView'
                                  Swift Package Manager
                                  iOS: Open Xcode, File->Swift Packages, search input https://github.com/janlionly/LogView.git, and then select Version Up to Next Major 1.0.2 < .
                                  Or add dependencies in your Package.swift:
                                  .package(url: "https://github.com/janlionly/LogView.git", .upToNextMajor(from: "1.0.2")),
                                  Usage
                                  let logView = LogView.shared
                                  // optional: your can customize initial frame
                                  logView.frame = CGRect(x:0, y:0, width: 200, height: 300)

                                  // make logView visible. Just call it only if the logView donot show.
                                  logView.makeVisible()

                                  // append your logs
                                  logView.append(log: "REQUEST API: xxx")

                                  // remove logView
                                  logView.remove()
                                  Requirements
                                  iOS 9.0+
                                  Swift 4.2 to 5.0+
                                  Author
                                  Visit my github: janlionly
                                  Contact with me by email: janlionly@gmail.com

                                  Contribute
                                  I would love you to contribute to LogView

                                  License
                                  LogView is available under the MIT license. See the LICENSE file for more info.
                                """)
        }
    }
}

