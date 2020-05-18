class SelfDrivingCar : Car {
  var destination: String?

  override func drive() {
    super.drive()

    if let userSetDestination = destination {
      print("driving towards \(userSetDestination)")
    }

  }
}
