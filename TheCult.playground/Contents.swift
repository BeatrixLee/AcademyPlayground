//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport


let cfURL = Bundle.main.url(forResource: "Quicksand-Bold", withExtension: "ttf")! as CFURL
  CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)


class MyViewController : UIViewController {
    
    @IBAction func touchedButton() {
        print("oi")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let buttonPlay = UIButton()
        buttonPlay.frame = CGRect(x: 312, y: 380, width: 759, height: 113)
        
        let imagePlay = UIImage(named: "Play")!
              buttonPlay.setImage(imagePlay, for: .normal)
        
        
        buttonPlay.addTarget(self, action: #selector(MyViewController.touchedButton), for: .touchUpInside)
        
        
        
        let buttonGallery = UIButton()
        buttonGallery.frame = CGRect(x: 334, y: 510, width: 759, height: 113)
        let imageGallery = UIImage(named: "gallery")!
        buttonGallery.setImage(imageGallery, for: .normal)
    
        
        buttonGallery.addTarget(self, action: #selector(MyViewController.touchedButton), for: .touchUpInside)
        
        let theCult = UILabel()
        theCult.frame = CGRect(x: 334, y: 140, width: 650, height: 75)
        theCult.text = "The Cult"
        theCult.textColor = .black
    
        let font = UIFont(name: "Quicksand-Bold", size: 100)
        theCult.font = font
        
        
        view.addSubview(buttonGallery)
        view.addSubview(buttonPlay)
        view.addSubview(theCult)
        
        self.view = view
        
        
    }
}

// Present the view controller in the Live View window


let viewController = MyViewController()
let vc = MyViewController(screenType: .mac , isPortrait: false)
PlaygroundPage.current.liveView = vc.scale(to: 0.4)


