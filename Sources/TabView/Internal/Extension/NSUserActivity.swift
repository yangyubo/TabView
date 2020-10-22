//
//  NSUserActivity.swift
//  TabView
//
//  Created by Adrian Labbé on 11-08-19.
//  Copyright © 2019 Ian McDowell. All rights reserved.
//

import UIKit

fileprivate struct UserActivityObjectHolder {
    
    static var localObjects = [NSUserActivityPersistentIdentifier?:UIViewController]()
}

public extension NSUserActivity {
    
    /// An object stored locally associated with the receiver activity.
    var viewController: UIViewController? {
        get {
            if #available(iOS 12.0, *) {
                return UserActivityObjectHolder.localObjects[persistentIdentifier]
            } else {
                return UserActivityObjectHolder.localObjects[nil]
            }
        }
        
        set {
            UserActivityObjectHolder.localObjects[nil] = newValue
        }
    }
}
