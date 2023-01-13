//
//  ReachabilityMock.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

@testable import Pulse

class ReachabilityMock: ReachabilityType {

    var forceError: Bool = false
    var didCallStatus: Bool = false

    func currentStatus() -> ReachabilityStatus {
        didCallStatus = true
        return forceError ? .notReachable : .reachableViaWiFi
    }
}
