import Network
import SwiftUI

public class NetworkMonitor: ObservableObject {
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    public var isConnected = false
    
    public init() {
        self.networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        
        self.networkMonitor.start(queue: self.workerQueue)
    }
}
