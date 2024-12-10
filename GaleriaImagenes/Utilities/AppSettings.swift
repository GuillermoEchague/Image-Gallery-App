//
//  AppSettings.swift
//  GaleriaImagenes
//
//  Created by Guillermo Echague on 09-12-24.
//

import Foundation
import SwiftUI

class AppSettings {
    @AppStorage("lastUsername") static var lastUsername = ""
    @AppStorage("lastScreen") static var lastScreen = "welcome"
}
