//
//  SwiftPigeonService.swift
//  Runner
//
//  Created by Alpha on 2021/12/15.
//

import Foundation
import Flutter

import UIKit

public class SwiftPigeonService: NSObject, FLTApi {

    
    
    public func getPlatformVersionWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTVersion? {

        let result = FLTVersion.init()

        result.string = "iOS " + UIDevice.current.systemVersion

        return result

    }

}
