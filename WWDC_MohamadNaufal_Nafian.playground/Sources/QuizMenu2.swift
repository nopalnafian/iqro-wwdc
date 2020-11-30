import UIKit
import Foundation
import AVFoundation
import PlaygroundSupport

public class QuizMenu2: UIViewController {
    
        let images : UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "ngaji.jpg")
            img.contentMode = .scaleAspectFill
            return img
        }()
        
        let layer : UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
            
            return view
        }()
        
        let titleLabel : UILabel = {
            let label = UILabel()
            label.text = "Quiz"
            label.font = UIFont.init(name: "Helvetica-Bold", size: 24)
            
            return label
        }()
        
        
        let quizButton : UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
            btn.imageView?.tintColor = .black
            btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: -5, bottom: 5, right: 0)
            btn.setTitle("Listen", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
            btn.addTarget(self, action: #selector(goToListen), for: .touchUpInside)
            return btn
        }()
    
    @objc func goToListen() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let ncv = ListenMode(collectionViewLayout: layout)
        ncv.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)

        PlaygroundPage.current.needsIndefiniteExecution = true
        
        navigationController?.pushViewController(ncv, animated: true)
    }
        
        let container : UIView = {
            let ctnr = UIView()
            ctnr.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
            ctnr.layer.cornerRadius = 10
            return ctnr
        }()

        let headphonesLogo : UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "headphone.png")
            img.contentMode = .scaleAspectFill
            return img
        }()

        let playAgain : UIButton = {
            let btn = UIButton()
            //btn.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
            //btn.imageView?.tintColor = .black
            //btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: -5, bottom: 5, right: 0)
            btn.setTitle("Start Quiz", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.setTitleColor(.black, for: .normal)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
            btn.addTarget(self, action: #selector(playAgainFunc), for: .touchUpInside)
            return btn
        }()

        @objc func playAgainFunc () {
            print("play again pressed")
            playAgain.setTitle("Listen Again", for: .normal)
            audioPlayers!.play()
        }

        let listenCareful : UILabel = {
            let label = UILabel()
            label.text = "Listen Carefully"
            label.font = UIFont.init(name: "SFProDisplay-Light", size: 26)
            label.textColor = .black

            return label
        }()

        let nextButton : UIButton = {
            let btn = UIButton()
            //btn.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
            //btn.imageView?.tintColor = .black
            //btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: -5, bottom: 5, right: 0)
            btn.setTitle("Next", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            //btn.layer.borderWidth = 1
            btn.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
            btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
            return btn
        }()
    
    @objc func handleNext() {
        let randomInt = Int.random(in: 0...26)
        activeSong = randomInt
        prepareSound()
        playSkipAnswer()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            self.audioPlayers!.play()
        }
    }
    
    func handleNextCorrect() {
        let randomInt = Int.random(in: 0...26)
        activeSong = randomInt
        prepareSound()
        audioPlayers!.play()
        
    }
    
    let correctLabel : UILabel = {
        let label = UILabel()
        label.text = "CORRECT !"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.init(displayP3Red: 30/255, green: 131/255, blue: 82/255, alpha: 0.6)
        label.textAlignment = .center
        
        return label
    }()
    
    let wrongLabel : UILabel = {
        let label = UILabel()
        label.text = "WRONG !"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.init(displayP3Red: 255/255, green: 0/255, blue: 23/255, alpha: 1)
        label.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 108/255, blue: 122/255, alpha: 0.4)
        label.textAlignment = .center
        
        return label
    }()

        let imagesName1 : CustomImageView = {

            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            //images.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap1)))
            //images.isUserInteractionEnabled = true
            //images.addGestureRecognizer(tap)
            return images
        }()


        let imagesName2 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            images.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap2)))
            //images.isUserInteractionEnabled = true
            return images
        }()

        let imagesName3 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName4 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName5 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName6 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName7 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName8 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName9 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName10 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName11 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName12 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName13 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName14 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName15 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName16 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName17 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName18 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName19 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName20 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName21 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName22 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName23 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName24 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName25 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName26 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()

        let imagesName27 : CustomImageView = {
            let images = CustomImageView()
            images.image = UIImage(named: "Kha.jpg")
            return images
        }()
//
//
        let listAlphabet = ["1.Alif.jpg", "2.Ba.jpg", "3.Ta.jpg", "4.Tsa.jpg", "5.Ja.jpg", "6.Ha.jpg", "7.Kha.jpg", "8.Da.jpg", "9.Dha.jpg", "10.Ro.jpg", "11.Za.jpg", "12.Sa.jpg","13.Sya.jpg" , "14.So.jpg", "15.Dho.jpg", "16.To.jpg","17.Zo.png", "18.Ain.jpg", "19.Go.jpg", "20.Fa.jpg", "21.Qa.jpg", "22.Ka.jpg", "23.La.jpg", "24.Ma.jpg", "25.Na.jpg", "27.Wa.jpg", "28.Ya.jpg"]

        let soundAlphabet = ["1.Alif", "2.Ba", "3.Ta", "4.Tsa", "5.Ja", "6.Ha", "7.Kha", "8.Da", "9.Dha", "10.Ro", "11.Za", "12.Sa","13.Sya" , "14.So", "15.Dho", "16.To","17.Zo", "18.Ain", "19.Go", "20.Fa", "21.Qa", "22.Ka", "23.La", "24.Ma", "25.Na", "27.Wa", "28.Ya"]
//
        var soundURL: URL?
        var audioPlayers : AVAudioPlayer?
        var responePlayers : AVAudioPlayer?
        var sound1 : URL = {
            let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "Alif", ofType: "mp3")!)
            return sound
        }()
    
    var correctAnswer : URL = {
        let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "effect correct1", ofType: "wav")!)
        return sound
    }()
    
    var nextSound : URL = {
        let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "effect negative", ofType: "wav")!)
        return sound
    }()
    
    public func playSkipAnswer() {
        do {
            let url = nextSound
            responePlayers = try AVAudioPlayer(contentsOf: url)
            responePlayers!.play()
        } catch {
            
        }
    }
    
    public func playCorrectAnswer() {
        do {
            let url = correctAnswer
            responePlayers = try AVAudioPlayer(contentsOf: url)
            responePlayers!.play()
        } catch {
            
        }
    }
    
    var wrongAnswer : URL = {
        let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "effect incorrect1", ofType: "wav")!)
        return sound
    }()
    
    public func playWrongAnswer() {
        do {
            let url = wrongAnswer
            responePlayers = try AVAudioPlayer(contentsOf: url)
            responePlayers!.play()
        } catch {
            
        }
    }
        var activeSong = 0
        func prepareSound() {
            do {
                    let audioPath = Bundle.main.path(forResource: soundAlphabet[activeSong], ofType: ".mp3")
                    try audioPlayers = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                    audioPlayers!.prepareToPlay()
            } catch {
                print("syalala", error.localizedDescription)
            }
        }

        lazy var imagesArrays = [self.imagesName1, self.imagesName2, self.imagesName3, self.imagesName4, self.imagesName5, self.imagesName6,self.imagesName7, self.imagesName8, self.imagesName9, self.imagesName10, self.imagesName11,self.imagesName12,self.imagesName13, self.imagesName14, self.imagesName15, self.imagesName16,self.imagesName17, self.imagesName18, self.imagesName19, self.imagesName20, self.imagesName21, self.imagesName22,self.imagesName23, self.imagesName24, self.imagesName25, self.imagesName26, self.imagesName27]

        let row1 = [0,9,18]
        let rows = [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26]
    
    public override func viewDidLoad() {
        let view = UIView()
        self.view = view
        view.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //navigationController?.isNavigationBarHidden = true
        //setting()
        setupLayout()
        setupGesture()
        prepareSound()
        
        correctLabel.isHidden = true
        wrongLabel.isHidden = true
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 236/255, green: 221/255, blue: 191/255, alpha: 0.4)
        navigationItem.title = "Iqro 1 - Quiz"
        

    }
    
    
    func setupGesture() {
        
        for i in 0...imagesArrays.count - 1 {
            imagesArrays[i].image = UIImage(named: listAlphabet[i])
        }
        for i in 0...imagesArrays.count - 1 {
            imagesArrays[i].isUserInteractionEnabled = true
        }
        
        //print(imagesArrays[2].isUserInteractionEnabled)
        imagesArrays[0].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap1)))
        imagesArrays[1].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap2)))
        imagesArrays[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap3)))
        imagesArrays[3].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap4)))
        imagesArrays[4].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap5)))
        imagesArrays[5].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap6)))
        imagesArrays[6].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap7)))
        imagesArrays[7].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap8)))
        imagesArrays[8].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap9)))
        imagesArrays[9].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap10)))
        imagesArrays[10].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap11)))
        imagesArrays[11].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap12)))
        imagesArrays[12].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap13)))
        imagesArrays[13].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap14)))
        imagesArrays[14].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap15)))
        imagesArrays[15].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap16)))
        imagesArrays[16].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap17)))
        imagesArrays[17].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap18)))
        imagesArrays[18].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap19)))
        imagesArrays[19].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap20)))
        imagesArrays[20].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap21)))
        imagesArrays[21].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap22)))
        imagesArrays[22].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap23)))
        imagesArrays[23].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap24)))
        imagesArrays[24].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap25)))
        imagesArrays[25].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap26)))
        imagesArrays[26].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap27)))

    }
    
    var isCorrect : Bool? = nil
    var whosTapped : Int! = 0
    
    func correctResponse() {
        if whosTapped == activeSong+1 {
            playCorrectAnswer()
            correctLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.correctLabel.isHidden = true
                self.handleNextCorrect()
            }
            
        } else {
            playWrongAnswer()
            wrongLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.wrongLabel.isHidden = true
             }
        }
    }
    
    
    @objc func tap1() {
        //print("1 tapped")
        //print("active", activeSong+1)
        whosTapped = 1
        //print("whos tapped", whosTapped as Int)
        correctResponse()
        
    }
    
    @objc func tap2() {
        //print("2 tapped")
        whosTapped = 2
        correctResponse()
        
    }
    
    @objc func tap3() {
        //print("3 tapped")
        whosTapped = 3
        correctResponse()
    }
    
    
    @objc func tap4() {
        //print("4 tapped")
        whosTapped = 4
        correctResponse()
    }

    
    @objc func tap5() {
        //print("5 tapped")
        whosTapped = 5
        correctResponse()
    }
    
    
    @objc func tap6() {
        //print("6 tapped")
        whosTapped = 6
        correctResponse()
    }
    
    
    @objc func tap7() {
        //print("7 tapped")
        whosTapped = 7
        correctResponse()
    }
    
    
    @objc func tap8() {
        //print("8 tapped")
        whosTapped = 8
        correctResponse()
    }
    
    
    @objc func tap9() {
        //print("9 tapped")
        whosTapped = 9
        correctResponse()
    }

    
    @objc func tap10() {
        //print("10 tapped")
        whosTapped = 10
        correctResponse()
    }

    @objc func tap11() {
        //print("11 tapped")
        //print("active", activeSong+1)
        whosTapped = 11
        correctResponse()
    }
    
    @objc func tap12() {
        whosTapped = 12
        correctResponse()
    }
    
    @objc func tap13() {
        
        whosTapped = 13
        correctResponse()
    }
    
    
    @objc func tap14() {
        
        whosTapped = 14
        correctResponse()
    }

    
    @objc func tap15() {
        
        whosTapped = 15
        correctResponse()
    }
    
    
    @objc func tap16() {
        
        whosTapped = 16
        correctResponse()
    }
    
    
    @objc func tap17() {
        
        whosTapped = 17
        correctResponse()
    }
    
    
    @objc func tap18() {
        
        whosTapped = 18
        correctResponse()
    }
    
    
    @objc func tap19() {
        
        whosTapped = 19
        correctResponse()
    }

    
    @objc func tap20() {
        
        whosTapped = 20
        correctResponse()
    }
    
    @objc func tap21() {

        whosTapped = 21
        correctResponse()
    }
    
    @objc func tap22() {
        whosTapped = 22
        correctResponse()
    }
    
    @objc func tap23() {
        
        whosTapped = 23
        correctResponse()
    }
    
    
    @objc func tap24() {
        
        whosTapped = 24
        correctResponse()
    }

    
    @objc func tap25() {
        
        whosTapped = 25
        correctResponse()
    }
    
    
    @objc func tap26() {
        
        whosTapped = 26
        correctResponse()
    }
    
    
    @objc func tap27() {
        
        whosTapped = 27
        correctResponse()
    }

    func setupLayout() {
        view.addSubview(images)
        images.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        images.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        images.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -200).isActive = true
        images.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        images.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(layer)
        layer.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        layer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        layer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        layer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        layer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: layer.topAnchor, constant: 120/1.75).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: layer.leadingAnchor, constant: 138/1.75).isActive = true
        
        view.addSubview(quizButton)
        quizButton.trailingAnchor.constraint(equalTo: layer.trailingAnchor, constant: -141/1.75).isActive = true
        quizButton.topAnchor.constraint(equalTo: layer.topAnchor, constant: 120/1.75).isActive = true
        quizButton.heightAnchor.constraint(equalToConstant: 40/1.75).isActive = true
        quizButton.widthAnchor.constraint(equalToConstant: 160/1.75).isActive = true
        quizButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(container)
        container.centerXAnchor.constraint(equalTo: layer.centerXAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: layer.bottomAnchor, constant: -53/1.75).isActive = true
        container.heightAnchor.constraint(equalToConstant: 266/1.75).isActive = true
        container.widthAnchor.constraint(equalToConstant: 800/1.75).isActive = true
        container.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0...imagesArrays.count - 1 {
            view.addSubview(imagesArrays[i])
            imagesArrays[i].translatesAutoresizingMaskIntoConstraints = false
            imagesArrays[i].widthAnchor.constraint(equalToConstant: 50/1.75).isActive = true
            imagesArrays[i].heightAnchor.constraint(equalToConstant: 50/1.75).isActive = true
        }
        
        for i in 0...8 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 34/1.75).isActive = true
        }
        //
        for i in 9...17 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 108/1.75).isActive = true
        }
        //
        for i in 18...26 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 182/1.75).isActive = true
        }
        //
        for i in row1 {
            imagesArrays[i].trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -98/1.75).isActive = true
        }
        
        for i in rows {
            imagesArrays[i].trailingAnchor.constraint(equalTo: imagesArrays[i-1].leadingAnchor, constant: -20/1.75).isActive = true
        }
        
        view.addSubview(headphonesLogo)
        headphonesLogo.translatesAutoresizingMaskIntoConstraints = false
        headphonesLogo.heightAnchor.constraint(equalToConstant: 150/1.75).isActive = true
        headphonesLogo.widthAnchor.constraint(equalToConstant: 150/1.75).isActive = true
        headphonesLogo.centerXAnchor.constraint(equalTo: layer.centerXAnchor, constant: -0).isActive = true
        headphonesLogo.topAnchor.constraint(equalTo: layer.topAnchor, constant: 120/1.75).isActive = true
        
        view.addSubview(listenCareful)
        listenCareful.translatesAutoresizingMaskIntoConstraints = false
        listenCareful.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        listenCareful.topAnchor.constraint(equalTo: view.topAnchor, constant: 250/1.75).isActive = true
        
        view.addSubview(playAgain)
        playAgain.translatesAutoresizingMaskIntoConstraints = false
        playAgain.heightAnchor.constraint(equalToConstant: 48/1.75).isActive = true
        playAgain.widthAnchor.constraint(equalToConstant: 160/1.75).isActive = true
        playAgain.centerXAnchor.constraint(equalTo: layer.centerXAnchor, constant: 0).isActive = true
        playAgain.topAnchor.constraint(equalTo: listenCareful.bottomAnchor, constant: 8).isActive = true
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 48/1.75).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 160/1.75).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: layer.centerXAnchor, constant: 0).isActive = true
        nextButton.topAnchor.constraint(equalTo: playAgain.bottomAnchor, constant: 0).isActive = true
        
        
        view.addSubview(correctLabel)
        correctLabel.translatesAutoresizingMaskIntoConstraints = false
        correctLabel.heightAnchor.constraint(equalToConstant: 36/1.75).isActive = true
        correctLabel.widthAnchor.constraint(equalToConstant: 315/1.75).isActive = true
        correctLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        correctLabel.bottomAnchor.constraint(equalTo: container.topAnchor, constant: -8).isActive = true
        
        view.addSubview(wrongLabel)
        wrongLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongLabel.heightAnchor.constraint(equalToConstant: 36/1.75).isActive = true
        wrongLabel.widthAnchor.constraint(equalToConstant: 315/1.75).isActive = true
        wrongLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wrongLabel.bottomAnchor.constraint(equalTo: container.topAnchor, constant: -8).isActive = true
        
//        
//        
//        
        
        
    }
    
}
