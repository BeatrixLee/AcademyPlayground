//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport


let cfURL = Bundle.main.url(forResource: "Quicksand-Bold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)


class FirstViewController : UIViewController {
    
    @IBAction func touchedButtonPlay() {
        print("tocou botão jogar")
        let vc = SecondViewController(screenType: .mac, isPortrait: true)
        navigationController?.pushViewController(vc, animated: true)
        

    }
    
    @IBAction func touchedButtonGallery() {
        print("tocou botão galeria")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
        imgBackground.image = UIImage(imageLiteralResourceName: "Background")
        
        
        let imgView = UIImageView(frame: CGRect(x: 118, y: 126, width: 1204, height: 660))
        imgView.image = UIImage(imageLiteralResourceName: "Rectangle 10")
        
        
        
        let buttonPlay = UIButton()
        buttonPlay.frame = CGRect(x: 312, y: 380, width: 780, height: 140)
        
        let imagePlay = UIImage(named: "Play")!
        buttonPlay.setImage(imagePlay, for: .normal)
        
        
        buttonPlay.addTarget(self, action: #selector(FirstViewController.touchedButtonPlay), for: .touchUpInside)
        
        
        
        let buttonGallery = UIButton()
        buttonGallery.frame = CGRect(x: 334, y: 510, width: 759, height: 140)
        let imageGallery = UIImage(named: "gallery")!
        buttonGallery.setImage(imageGallery, for: .normal)
        
        
        buttonGallery.addTarget(self, action: #selector(FirstViewController.touchedButtonGallery), for: .touchUpInside)
        
        let theCult = UILabel()
        theCult.frame = CGRect(x: 520, y: 220, width: 650, height: 75)
        theCult.text = "The Cult"
        theCult.textColor = .black
        
        let font = UIFont(name: "Quicksand-Bold", size: 100)
        theCult.font = font
        
        
       
        
        
        view.addSubview(imgBackground)
        view.addSubview(imgView)
        view.addSubview(buttonGallery)
        view.addSubview(buttonPlay)
        view.addSubview(theCult)
        
        self.view = view
        
        
    }
}

class SecondViewController: UIViewController {
    
    @IBAction func touchedButtonEasy() {
        print("tocou botão facil")
        let vc = ThirdViewController(screenType: .mac, isPortrait: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func touchedButtonMedium() {
        print("tocou botão medio")
    }
    
    @IBAction func touchedButtonHard() {
           print("tocou botão dificil")
       }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
               imgBackground.image = UIImage(imageLiteralResourceName: "Background")
        
        let imgView = UIImageView(frame: CGRect(x: 118, y: 251, width: 1193, height: 415))
               imgView.image = UIImage(imageLiteralResourceName: "Rectangle 10")
        
        let dificuldade = UILabel()
        dificuldade.frame = CGRect(x: 390, y: 320, width: 928, height: 107)
        dificuldade.text = "Defina a dificuldade"
        dificuldade.textColor = .black
        
        let font = UIFont(name: "Quicksand-Bold", size: 70)
        dificuldade.font = font
        
        let buttonEasy = UIButton()
               buttonEasy.frame = CGRect(x: 179, y: 456, width: 340, height: 117)
               
               let imageEasy = UIImage(named: "Facil")!
               buttonEasy.setImage(imageEasy, for: .normal)
               
               buttonEasy.addTarget(self, action: #selector(SecondViewController.touchedButtonEasy), for: .touchUpInside)
        
        let buttonMedium = UIButton()
        buttonMedium.frame = CGRect(x: 552, y: 454, width: 340, height: 117)
        
        let imageMedium = UIImage(named: "Medio")!
        buttonMedium.setImage(imageMedium, for: .normal)
        
        buttonMedium.addTarget(self, action: #selector(SecondViewController.touchedButtonMedium), for: .touchUpInside)
        
        let buttonHard = UIButton()
        buttonHard.frame = CGRect(x: 923, y: 454, width: 340, height: 117)
        
        let imageHard = UIImage(named: "Dificil")!
        buttonHard.setImage(imageHard, for: .normal)
        
        buttonHard.addTarget(self, action: #selector(SecondViewController.touchedButtonHard), for: .touchUpInside)
        
        view.addSubview(imgBackground)
        view.addSubview(imgView)
        view.addSubview(dificuldade)
        view.addSubview(buttonEasy)
        view.addSubview(buttonMedium)
        view.addSubview(buttonHard)
        self.view = view
    }
}

class ThirdViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
        imgBackground.image = UIImage(imageLiteralResourceName: "Background")
        
        let imgView = UIImageView(frame: CGRect(x: 118, y: 251, width: 1193, height: 415))
        imgView.image = UIImage(imageLiteralResourceName: "Rectangle 10")
        
        let start = UILabel()
             start.frame = CGRect(x: 350, y: 300, width: 928, height: 300)
             start.text = "Os jogos começaram!\n Descubra a cultura "
             start.textColor = .black
             
        start.numberOfLines = 0
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "Quicksand-Bold", size: 70)! ]
        let myString = NSMutableAttributedString(string: "Os jogos começaram!\n Descubra a cultura", attributes: myAttribute)
        
        let myRange = NSRange(location: 19, length: 20)
        myString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: myRange)
       
        start.attributedText = myString
    
        
        view.addSubview(imgBackground)
        view.addSubview(imgView)
        view.addSubview(start)
        self.view = view
        
    }
}

// Present the view controller in the Live View window


let viewController = FirstViewController()
let vc = FirstViewController(screenType: .mac , isPortrait: true)
let navigationController = UINavigationController(screenType: .mac , isPortrait: true)
navigationController.pushViewController(vc, animated: true)
navigationController.navigationBar.isHidden = true
PlaygroundPage.current.liveView = navigationController.scale(to: 0.4)



