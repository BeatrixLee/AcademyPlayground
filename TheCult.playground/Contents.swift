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
        vc.difficulty = 120
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func touchedButtonMedium() {
        print("tocou botão medio")
        let vc = ThirdViewController(screenType: .mac, isPortrait: true)
        vc.difficulty = 60
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func touchedButtonHard() {
        print("tocou botão dificil")
        let vc = ThirdViewController(screenType: .mac, isPortrait: true)
        vc.difficulty = 30
        navigationController?.pushViewController(vc, animated: true)
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
    var difficulty: Int?
    
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
                
                vc.timeLeft = self.difficulty
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

class FourthViewController: UIViewController {
    
    var timeLabel: UILabel = UILabel()
    var timer:Timer?
    var timeLeft: Int?
    let timerLabel: UILabel = UILabel()
    let fontBold = UIFont(name: "Quicksand-Bold", size: 80)
    let fontMedium = UIFont(name: "Quicksand-Medium", size: 32)
    let buttonAnswer = UIButton()
    let buttonTip1 = UIButton()
    let buttonTip2 = UIButton()
    let buttonTip3 = UIButton()
    let buttonTip4 = UIButton()
    let buttonTip5 = UIButton()
    let buttonTip6 = UIButton()
    let answerLabel = UILabel()
    let card = UIImageView()
    
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
        
        buttonTip1.frame = CGRect(x: 0, y: 586, width: 314, height: 314)
        
        buttonTip1.setTitle("Tip1", for: .normal)
        buttonTip1.titleLabel?.isHidden = true
        
        let imageButton1 = UIImage(named: "ButtonTip1")!
        buttonTip1.setImage(imageButton1, for: .normal)
        
        buttonTip1.addTarget(self, action: #selector(FourthViewController.touchedTip), for: .touchUpInside)
        
        buttonTip2.frame = CGRect(x: 602, y: 735, width: 248, height: 165)
        
        buttonTip2.setTitle("Tip2", for: .normal)
        buttonTip2.titleLabel?.isHidden = true

        let imageButton2 = UIImage(named: "ButtonTip2")!
        buttonTip2.setImage(imageButton2, for: .normal)
        
        buttonTip2.addTarget(self, action: #selector(FourthViewController.touchedTip), for: .touchUpInside)
        
        buttonTip3.frame = CGRect(x: 1126, y: 586, width: 314, height: 314)
        buttonTip3.setTitle("Tip3", for: .normal)
        buttonTip3.titleLabel?.isHidden = true

        
        let imageButton3 = UIImage(named: "ButtonTip3")!
        buttonTip3.setImage(imageButton3, for: .normal)
        
        buttonTip3.addTarget(self, action: #selector(FourthViewController.touchedTip), for: .touchUpInside)
        
        buttonTip4.frame = CGRect(x: 0, y: 262, width: 236, height: 236)
        buttonTip4.setTitle("Tip4", for: .normal)
        buttonTip4.titleLabel?.isHidden = true
        
        let imageButton4 = UIImage(named: "ButtonTip4")!
        buttonTip4.setImage(imageButton4, for: .normal)
        
        buttonTip4.addTarget(self, action: #selector(FourthViewController.touchedTip), for: .touchUpInside)
        
        buttonTip5.frame = CGRect(x: 1204, y: 262, width: 236, height: 236)
        buttonTip5.setTitle("Tip5", for: .normal)
        buttonTip5.titleLabel?.isHidden = true
        
        let imageButton5 = UIImage(named: "ButtonTip5")!
        buttonTip5.setImage(imageButton5, for: .normal)
        
        buttonTip5.addTarget(self, action: #selector(FourthViewController.touchedTip), for: .touchUpInside)
        
        buttonTip6.frame = CGRect(x: 314, y: -34, width: 812, height: 195)
        buttonTip6.setTitle("Tip6", for: .normal)
        buttonTip6.titleLabel?.isHidden = true
        
        let imageButton6 = UIImage(named: "ButtonTip6")!
        buttonTip6.setImage(imageButton6, for: .normal)
        
        buttonTip6.addTarget(self, action: #selector(FourthViewController.touchedTip), for: .touchUpInside)
        
        
        view.addSubview(imgBackground)
        view.addSubview(timerLabel)
        view.addSubview(timeLabel)
        view.addSubview(buttonAnswer)
        view.addSubview(answerLabel)
        view.addSubview(buttonTip1)
        view.addSubview(buttonTip2)
        view.addSubview(buttonTip3)
        view.addSubview(buttonTip4)
        view.addSubview(buttonTip5)
        view.addSubview(buttonTip6)
        
        self.view = view
    }
    
    @IBAction func touchedButtonAnswer() {
        print("tocou botão responder")
        let vc = FifthViewController(screenType: .mac, isPortrait: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func touchedTip(_ sender: UIButton) {
            let vc = SixthViewController(screenType: .mac, isPortrait: true)
        vc.button = sender.titleLabel?.text
        navigationController?.pushViewController(vc, animated: true)
        }
        
    @objc func onTimerFires() {
        
        timeLeft! -= 1
        timeLabel.text = "\(timeLeft!)s"
        
        if timeLeft! <= 0 {
            timer?.invalidate()
            timer = nil
            
            let vc = FifthViewController(screenType: .mac, isPortrait: true)
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}


class FifthViewController: UIViewController {
    
    let cultureLabel: UILabel = UILabel()
    let fontBold = UIFont(name: "Quicksand-Bold", size: 80)
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
        imgBackground.image = UIImage(imageLiteralResourceName: "Background")
        
        let imgView = UIImageView(frame: CGRect(x: 125, y: 172, width: 1181, height: 547))
        imgView.image = UIImage(imageLiteralResourceName: "RectangleAnswer")
        
        cultureLabel.frame = CGRect(x: 238, y: 210, width: 928, height: 107)
        cultureLabel.textColor = .black
        cultureLabel.text = "De quem é a cultura?"
        cultureLabel.font = fontBold
        cultureLabel.textAlignment = .center
        
        button1.frame = CGRect(x: 176.8, y: 341, width: 225, height: 320)
        
        let imageButton1 = UIImage(named: "Japão")!
        button1.setImage(imageButton1, for: .normal)
        
        button2.frame = CGRect(x: 456.3, y: 341, width: 225, height: 320)
        
        let imageButton2 = UIImage(named: "Espanha")!
        button2.setImage(imageButton2, for: .normal)
        
        button3.frame = CGRect(x: 735, y: 341, width: 225, height: 320)
        
        let imageButton3 = UIImage(named: "China")!
        button3.setImage(imageButton3, for: .normal)
        
        button4.frame = CGRect(x: 1015.63, y: 341, width: 225, height: 320)
        
        let imageButton4 = UIImage(named: "Portugal")!
        button4.setImage(imageButton4, for: .normal)
        
        view.addSubview(imgBackground)
        view.addSubview(imgView)
        view.addSubview(cultureLabel)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        self.view = view
        
        
    }
    
}

class SixthViewController: UIViewController {
    
    var buttonBack = UIButton()
    var button: String?
    var image: UIImageView?
    
    override func loadView() {
        
        
        let view = UIView()
        view.backgroundColor = .white
        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 1440, height: 900))
        imgBackground.image = UIImage(imageLiteralResourceName: "Background")
        imgBackground.isUserInteractionEnabled = true
        let tapOut = UITapGestureRecognizer(target: self, action: #selector(back))
            
            imgBackground.addGestureRecognizer(tapOut)


        image = UIImageView(frame: CGRect(x: 298, y: 51, width: 853, height: 791))
        
        
        
        
        view.addSubview(imgBackground)
        view.addSubview(image!)
        
        self.view = view
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let imagem = UIImage(named: button!)
        self.image?.image = imagem
        print(button)
        
    }
    
    @IBAction func back(){
        navigationController?.popViewController(animated: true)
    }
}




// Present the view controller in the Live View window


let viewController = FirstViewController()
let vc = FirstViewController(screenType: .mac , isPortrait: true)
let navigationController = UINavigationController(screenType: .mac , isPortrait: true)
navigationController.pushViewController(vc, animated: true)
navigationController.navigationBar.isHidden = true
PlaygroundPage.current.liveView = navigationController.scale(to: 0.4)



