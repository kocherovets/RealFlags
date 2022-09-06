//
//  RealFlags
//  Easily manage Feature Flags in Swift
//
//  Created by the Mobile Team @ ImmobiliareLabs
//  Email: mobile@immobiliare.it
//  Web: http://labs.immobiliare.it
//
//  Copyright ©2021 Immobiliare.it SpA. All rights reserved.
//  Licensed under MIT License.
//

import Foundation

extension Bundle {
    private static let internalBundle = Bundle(for: FlagsBrowserController.self)

    internal static var libraryBundle: Bundle {
        #if SWIFT_PACKAGE
            Bundle.module
        #else
            let candidates = [
                // Bundle should be present here when the package is linked into an App.
                Bundle.main.resourceURL,

                // Bundle should be present here when the package is linked into a framework.
                internalBundle.resourceURL,

                // For command-line tools.
                Bundle.main.bundleURL,
            ]

            for candidate in candidates {
                let bundlePath = candidate?.appendingPathComponent("RealFlags.bundle")
                if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                    return bundle
                }
            }

            return Bundle.main
        #endif
    }
    
    internal static var imageBundle: Bundle {
        Bundle(identifier: "ABG.Media") ?? Bundle.main
    }
}
