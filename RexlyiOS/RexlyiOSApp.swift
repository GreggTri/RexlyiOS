//
//  RexlyiOSApp.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 2/21/23.
//

import SwiftUI

var apiURL:String = "https://api.rexly.co"

@main
struct RexlyiOSApp: App {
    var body: some Scene {
        WindowGroup {
            ChatView()
        }
    }
}
