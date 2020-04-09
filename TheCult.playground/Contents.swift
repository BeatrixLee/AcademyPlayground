//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport


var cfURL = Bundle.main.url(forResource: "Quicksand-Bold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

  cfURL = Bundle.main.url(forResource: "Quicksand-Medium", withExtension: "ttf")! as CFURL
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
    
    var timeLabel: UILabel = UILabel()
    let start = UILabel()
    var timer:Timer?
    var timeLeft = 3
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
        imgBackground.image = UIImage(imageLiteralResourceName: "Background")
        
        let imgView = UIImageView(frame: CGRect(x: 118, y: 251, width: 1193, height: 415))
        imgView.image = UIImage(imageLiteralResourceName: "Rectangle 10")
        
        
        start.frame = CGRect(x: 250, y: 300, width: 928, height: 300)
        start.text = "Os jogos começaram!\n Descubra a cultura"
        start.textColor = .black
        start.numberOfLines = 0
        start.textAlignment = .center
        
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "Quicksand-Bold", size: 70)! ]
        let myString = NSMutableAttributedString(string: "Os jogos começaram!\n", attributes: myAttribute)
        

        let bigFont = UIFont(name: "Quicksand-Bold", size: 90)
        let bigAtt = [NSAttributedString.Key.font : bigFont, NSAttributedString.Key.foregroundColor : UIColor.purple]

        myString.append(NSAttributedString(string: "Descubra a cultura", attributes: bigAtt as [NSAttributedString.Key : Any]))
        
        
        
    
        

        
        start.attributedText = myString
        
        
        view.addSubview(imgBackground)
        view.addSubview(imgView)
        view.addSubview(start)
        self.view = view
        
    }
    
    @objc func onTimerFires() {
        
        timeLeft -= 1
        timeLabel.text = "\(timeLeft) seconds left"
        
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
            
            DispatchQueue.main.async {
                let vc = FourthViewController(screenType: .mac, isPortrait: true)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

class FourthViewController: UIViewController {
    
    var timeLabel: UILabel = UILabel()
    var timer:Timer?
    var timeLeft = 120
    let timerLabel: UILabel = UILabel()
    let fontBold = UIFont(name: "Quicksand-Bold", size: 80)
    let fontMedium = UIFont(name: "Quicksand-Medium", size: 32)
    let buttonAnswer = UIButton()
    let answerLabel = UILabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        timerLabel.frame = CGRect(x: 675, y: 290, width: 100, height: 61)
        timerLabel.textColor = .white
        timerLabel.text = "TIMER"
        timerLabel.font = fontMedium
        
        
        answerLabel.frame = CGRect(x: 572, y: 380, width: 306, height: 158)
        answerLabel.textColor = .white
        answerLabel.text = "Já sabe a resposta?"
        answerLabel.font = fontMedium
        
        
        timeLabel.frame = CGRect(x: 610, y: 355, width: 222, height: 61)
        timeLabel.textColor = .white
        timeLabel.font = fontBold
        timeLabel.textAlignment = .center
       
                    
       
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)

        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
        imgBackground.image = UIImage(imageLiteralResourceName: "BGCLEAN")
        
               buttonAnswer.frame = CGRect(x: 570, y: 498, width: 300, height: 180)
               
               let imageAnswer = UIImage(named: "botaoResponder")!
               buttonAnswer.setImage(imageAnswer, for: .normal)
               
               buttonAnswer.addTarget(self, action: #selector(FourthViewController.touchedButtonAnswer), for: .touchUpInside)
        
        
        view.addSubview(imgBackground)
        view.addSubview(timerLabel)
        view.addSubview(timeLabel)
        view.addSubview(buttonAnswer)
        view.addSubview(answerLabel)
        self.view = view
    }
    
    @IBAction func touchedButtonAnswer() {
           print("tocou botão responder")
       }
    
    @objc func onTimerFires() {
         
         timeLeft -= 1
         timeLabel.text = "\(timeLeft)s"
         
         if timeLeft <= 0 {
             timer?.invalidate()
             timer = nil
             
         }
     }
}
// Present the view controller in the Live View window


let viewController = FirstViewController()
let vc = FirstViewController(screenType: .mac , isPortrait: true)
let navigationController = UINavigationController(screenType: .mac , isPortrait: true)
navigationController.pushViewController(vc, animated: true)
navigationController.navigationBar.isHidden = true
PlaygroundPage.current.liveView = navigationController.scale(to: 0.4)



