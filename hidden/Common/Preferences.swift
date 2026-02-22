//
//  Preferences.swift
//  Hidden Bar
//
//  Created by phucld on 12/18/19.
//  Copyright © 2019 Dwarves Foundation. All rights reserved.
//

import Foundation

enum Preferences {

    private static var _cachedGlobalKey: GlobalKeybindPreferences?
    private static var _globalKeyCacheValid = false

    static var globalKey: GlobalKeybindPreferences? {
        get {
            if _globalKeyCacheValid { return _cachedGlobalKey }
            guard let data = UserDefaults.standard.value(forKey: UserDefaults.Key.globalKey) as? Data else {
                _cachedGlobalKey = nil
                _globalKeyCacheValid = true
                return nil
            }
            _cachedGlobalKey = try? JSONDecoder().decode(GlobalKeybindPreferences.self, from: data)
            _globalKeyCacheValid = true
            return _cachedGlobalKey
        }

        set {
            if let newValue = newValue {
                guard let data = try? JSONEncoder().encode(newValue) else { return }
                UserDefaults.standard.set(data, forKey: UserDefaults.Key.globalKey)
            } else {
                UserDefaults.standard.removeObject(forKey: UserDefaults.Key.globalKey)
            }
            _cachedGlobalKey = newValue
            _globalKeyCacheValid = true

            NotificationCenter.default.post(Notification(name: .prefsChanged))
        }
    }
    
    static var isAutoStart: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaults.Key.isAutoStart)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Key.isAutoStart)
            
            Util.setUpAutoStart(isAutoStart: newValue)
            
            NotificationCenter.default.post(Notification(name: .prefsChanged))
        }
    }
    
    static var numberOfSecondForAutoHide: Double {
        get {
            UserDefaults.standard.double(forKey: UserDefaults.Key.numberOfSecondForAutoHide)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Key.numberOfSecondForAutoHide)
            
            NotificationCenter.default.post(Notification(name: .prefsChanged))
        }
    }
    
    static var isAutoHide: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaults.Key.isAutoHide)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Key.isAutoHide)
            
            NotificationCenter.default.post(Notification(name: .prefsChanged))
        }
    }
    
    static var isShowPreference: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaults.Key.isShowPreference)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Key.isShowPreference)
            
            NotificationCenter.default.post(Notification(name: .prefsChanged))
        }
    }
    
    static var areSeparatorsHidden: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaults.Key.areSeparatorsHidden)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Key.areSeparatorsHidden)
        }
    }
    
    static var alwaysHiddenSectionEnabled: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaults.Key.alwaysHiddenSectionEnabled)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Key.alwaysHiddenSectionEnabled)
            NotificationCenter.default.post(Notification(name: .alwaysHideToggle))
        }
    }
    
    static var useFullStatusBarOnExpandEnabled: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaults.Key.useFullStatusBarOnExpandEnabled)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Key.useFullStatusBarOnExpandEnabled)
        }
    }
    
    
}
