class PaymentController {
    let services: [Service]

    init(services: [Service]) {
        self.services = services
    }
    
    func calculateEarnings() -> Float {
        return services.reduce(0) { $0 + $1.total }
    }
}

var amazonService = make(service: .amazon)
var etsyService = make(service: .etsy)

let controller = PaymentController(services: [amazonService, etsyService])

amazonService.add(payment: 100)
etsyService.add(payment: 25)
amazonService.add(payment: 12.50)

print("Total earned: \(controller.calculateEarnings())")
