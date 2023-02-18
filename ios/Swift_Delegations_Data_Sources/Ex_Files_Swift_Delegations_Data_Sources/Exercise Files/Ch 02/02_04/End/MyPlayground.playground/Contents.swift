import UIKit
import PlaygroundSupport

protocol ColorChooserDelegate{
    func selectedColor(color:Int)
}

class Colors{
    var colorIndex = 0
    let colorName = ["red","green","blue","purple"]
    private let color = [UIColor.red,UIColor.green,UIColor.blue,UIColor.purple]
    func name(_ index:Int) -> String{
        return colorName[index % colorName.count]
    }
    func color(_ index:Int) -> UIColor{
        return color[index % color.count]
    }
}
class ColorChooserVC:UIViewController{
    var colors = Colors()
    var currentColor = 0
    var delegate:ColorChooserDelegate! = nil
    @IBAction func chooser(sender:UISegmentedControl){
        currentColor = sender.selectedSegmentIndex
        view.backgroundColor = colors.color(currentColor)
        delegate.selectedColor(color: currentColor)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        let chooser = UISegmentedControl(items: colors.colorName)
        chooser.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        chooser.addTarget(self, action: #selector(chooser(sender:)), for: .valueChanged)
        chooser.tintColor = UIColor.black
        view.addSubview(chooser)
        view.backgroundColor = colors.color(currentColor)
    }
}


class ViewController:UIViewController, ColorChooserDelegate{
    func selectedColor(color: Int) {
        count = color
        view.backgroundColor = colors.color(color)
    }
    
    var count = 0
    var colors = Colors()
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
    @IBAction func changeColor(sender:UIButton){
        //count += 1
        //view.backgroundColor = colors.color(count % colors.colorName.count)
        let vc = ColorChooserVC()
        vc.currentColor = count
        vc.delegate = self
        present(vc, animated: true, completion: nil)
        
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














