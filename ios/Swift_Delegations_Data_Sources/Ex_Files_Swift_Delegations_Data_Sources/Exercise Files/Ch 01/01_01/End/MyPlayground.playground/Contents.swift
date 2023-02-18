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






