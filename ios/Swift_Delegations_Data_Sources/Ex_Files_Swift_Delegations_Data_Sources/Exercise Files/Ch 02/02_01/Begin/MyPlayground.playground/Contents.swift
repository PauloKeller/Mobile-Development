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

class ViewController:UIViewController{
    var count = 0
    var colors = Colors()
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
    @IBAction func changeColor(sender:UIButton){
        count += 1
        view.backgroundColor = colors.color(count % colors.colorName.count)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.orange
        button.setTitle("Color Choice", for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }
}


let colors = Colors()
let myColor = colors.color(1)

//let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
PlaygroundPage.current.liveView = ViewController()














