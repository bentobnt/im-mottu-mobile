import Flutter
import UIKit
import Network

@main
@objc class AppDelegate: FlutterAppDelegate {
    // MARK: - Properties
    private var monitor: NWPathMonitor?
    var currentPathStatus: NWPath.Status?

    // MARK: - Delegate methods
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupFlutter()
        self.monitorNetwork()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationWillTerminate(_ application: UIApplication) {
        monitor?.cancel()
    }

    // MARK: - Private methods
    private func setupFlutter() {
        GeneratedPluginRegistrant.register(with: self)
        let controller = window?.rootViewController as! FlutterViewController
        FlutterHelper.shared.loadMethodChannel(controller: controller)
    }

    private func monitorNetwork() {
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { path in
            if self.currentPathStatus == nil {
                self.currentPathStatus = path.status
            }

            if self.currentPathStatus != path.status {
                self.currentPathStatus = path.status
                FlutterHelper.shared.invokeChangeConnectionStatus(path.status == .satisfied ? "conectado" : "desconectado")
            }
        }

        let queue = DispatchQueue(label: "MonitorNetwork")
        monitor?.start(queue: queue)
    }
}
