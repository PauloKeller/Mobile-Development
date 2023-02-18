import UIKit
import PlaygroundSupport

class Colors{
    var colorIndex = 0
    let colorName = ["red","green","blue","purple"]
    private let color = [UIColor.red,UIColor.green,UIColor.blue,UIColor.purple]
    func name(_ index:Int) -> String{
        return colorName[index]
    }
    func color(_ index:Int) -> UIColor{
        return color[index]
    }
}

let colors = Colors()
let myColor = colors.color(1)

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
PlaygroundPage.current.liveView = view
view.backgroundColor = UIColor.orange

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
button.setTitle("Color Choice", for: .normal)
button.backgroundColor = UIColor.darkGray
view.addSubview(button)













