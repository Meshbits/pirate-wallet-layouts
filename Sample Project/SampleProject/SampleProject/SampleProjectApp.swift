//
//  SampleProjectApp.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 12/07/21.
//

import SwiftUI

@main

struct SampleProjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AuthenticateFaceID()
            }
        }
    }
}
