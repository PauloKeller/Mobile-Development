/*:
# Chapter 4.3 - Backpressure (Begin)
Backpressure is a quite overlooked yet powerful control knob in the Publisher/Subscriber model, supported by the framework. I will spend a few minutes going through what Backpressure in Combine is, and why you would want to make use of it.

*/

import Foundation
import Combine

let cityPublisher = (["San Jose", "San Francisco", "Menlo Park", "Palo Alto", ]).publisher

final class CitySubscriber: Subscriber {
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("City: \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Subscription \(completion)")
    }
    
    typealias Input = String
    typealias Failure = Never
}

let citySubscription = CitySubscriber()
cityPublisher.subscribe(citySubscription )



