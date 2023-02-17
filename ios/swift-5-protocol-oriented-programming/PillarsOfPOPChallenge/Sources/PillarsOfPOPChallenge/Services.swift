import Foundation

public protocol Service {
    var total: Float { get }
    mutating func add(payment: Float)
}

private class AmazonService {
    private var balance: Float = 0
    
    fileprivate init() {}
    
    private func orderPlaced(payment: Float) {
        balance += payment
    }
    
    private var earnings: Float {
        return balance
    }
}

extension AmazonService: Service {
    public var total: Float {
        return earnings
    }
    
    public func add(payment: Float) {
        orderPlaced(payment: payment)
    }
}

private class EtsyService {
    private var earnings: Float = 0
    
    fileprivate init() {}
    
    private func itemSold(profit: Float) {
        earnings += profit
    }
    
    private var totalSold: Float {
        return earnings
    }
}

extension EtsyService: Service {
    public var total: Float {
        return totalSold
    }

    public func add(payment: Float) {
        return itemSold(profit: payment)
    } 
}

public enum ServiceType {
    case amazon
    case etsy
}

public func make(service: ServiceType) -> Service {
    switch service {
        case .amazon:
            return AmazonService()
        case .etsy:
            return EtsyService()
    }
}
