//
//  FlutterHelper.swift
//  Runner
//
//  Created by Bento luiz Rodrigues filho on 14/09/24.
//

import Foundation
import Flutter

class FlutterHelper {
    // MARK: - Shared instance
    static var shared = FlutterHelper()

    // MARK: - Properties
    var methodChannel: FlutterMethodChannel?

    // MARK: - Public methods
    func loadMethodChannel(controller: FlutterViewController) {
        self.methodChannel = FlutterMethodChannel(name: "method_channel", binaryMessenger: controller.binaryMessenger)
        self.methodChannel?.setMethodCallHandler {(call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case "":
                break
            default:
                break
            }
        }
    }

    func invokeChangeConnectionStatus(_ status: String) {
        self.methodChannel?.invokeMethod("listenerChangeConnection", arguments: status)
    }
}
