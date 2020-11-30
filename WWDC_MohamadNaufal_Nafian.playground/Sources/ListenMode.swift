import UIKit
import PlaygroundSupport
import AVFoundation

public class ListenMode: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let listAlphabet = ["1.Alif.jpg", "2.Ba.jpg", "3.Ta.jpg", "4.Tsa.jpg", "5.Ja.jpg", "6.Ha.jpg", "7.Kha.jpg", "8.Da.jpg", "9.Dha.jpg", "10.Ro.jpg", "11.Za.jpg", "12.Sa.jpg","13.Sya.jpg" , "14.So.jpg", "15.Dho.jpg", "16.To.jpg","17.Zo.png", "18.Ain.jpg", "19.Go.jpg", "20.Fa.jpg", "21.Qa.jpg", "22.Ka.jpg", "23.La.jpg", "24.Ma.jpg", "25.Na.jpg", "26.ha.jpg", "27.Wa.jpg", "28.Ya.jpg"]
    let soundAlphabet = ["1.Alif", "2.Ba", "3.Ta", "4.Tsa", "5.Ja", "6.Ha", "7.Kha", "8.Da", "9.Dha", "10.Ro", "11.Za", "12.Sa","13.Sya" , "14.So", "15.Dho", "16.To","17.Zo", "18.Ain", "19.Go", "20.Fa", "21.Qa", "22.Ka", "23.La", "24.Ma", "25.Na", "26.ha", "27.Wa", "28.Ya"]

    lazy var arrayOfArray = [[String]]()
    lazy var arrayOfSound = [[String]]()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    let quizButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        btn.imageView?.tintColor = .black
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: -5, bottom: 5, right: 0)
        btn.setTitle("Quiz", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(goToQuiz), for: .touchUpInside)
        return btn
    }()
    
    @objc func goToQuiz() {
        print("print")
        let qm2 = QuizMenu2()
        qm2.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)
        PlaygroundPage.current.needsIndefiniteExecution = true
        navigationController?.pushViewController(qm2, animated: true)
    }

    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext() {
        print("next tapped")
        let nextIndex = min(pageControl.currentPage + 1, self.listAlphabet.count-1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        pageLabel.text = "Page \((pageControl.currentPage)+1) / 29"
    }
    
    @objc func handlePrev() {
        print("prev tapped")
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        pageLabel.text = "Page \((pageControl.currentPage)+1) / 29"
        
        
    }
    
    let pageLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Page 1 / 29"
        return label
    }()

    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = self.listAlphabet.count
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .blue
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.register(newListenCard.self, forCellWithReuseIdentifier: "cellId")
        navigationItem.title = "Iqro 1 - Listen"
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 236/255, green: 221/255, blue: 191/255, alpha: 0.4)
        

        
        var newArray2 = [[String]]()
        var newArraySound = [[String]]()
        for i in (0...listAlphabet.count-2) {
            let newArray = [listAlphabet[i], listAlphabet[i+1], listAlphabet[i], listAlphabet[i+1],listAlphabet[i], listAlphabet[i+1],listAlphabet[i], listAlphabet[i+1], listAlphabet[i], listAlphabet[i+1], listAlphabet[i], listAlphabet[i+1],listAlphabet[i], listAlphabet[i+1],listAlphabet[i], listAlphabet[i+1], listAlphabet[i], listAlphabet[i+1], listAlphabet[i], listAlphabet[i+1],listAlphabet[i], listAlphabet[i+1],listAlphabet[i], listAlphabet[i+1], listAlphabet[i], listAlphabet[i+1] ]
            newArray2.append(newArray)
            
            let soundArray = [soundAlphabet[i], soundAlphabet[i+1], soundAlphabet[i], soundAlphabet[i+1],soundAlphabet[i], soundAlphabet[i+1],soundAlphabet[i], soundAlphabet[i+1], soundAlphabet[i], soundAlphabet[i+1], soundAlphabet[i], soundAlphabet[i+1],soundAlphabet[i], soundAlphabet[i+1],soundAlphabet[i], soundAlphabet[i+1], soundAlphabet[i], soundAlphabet[i+1], soundAlphabet[i], soundAlphabet[i+1],soundAlphabet[i], soundAlphabet[i+1],soundAlphabet[i], soundAlphabet[i+1], soundAlphabet[i], soundAlphabet[i+1] ]
            newArraySound.append(soundArray)
        }
        arrayOfArray = newArray2
        arrayOfSound = newArraySound
        
        setupLayout()
    }
    
    func setupLayout() {
        
        view.addSubview(previousButton)
        previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        previousButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextButton)
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageLabel)
        pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pageLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(quizButton)
        quizButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        quizButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 130/1.75).isActive = true
        quizButton.heightAnchor.constraint(equalToConstant: 40/1.75).isActive = true
        quizButton.widthAnchor.constraint(equalToConstant: 160/1.75).isActive = true
        quizButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          print(arrayOfArray.count)
          return arrayOfArray.count
    
      }
      
      override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! newListenCard
          //cell.soundArray = self.arrayOfSound[indexPath.row]
          cell.imagesName1.image = UIImage(named: arrayOfArray[indexPath.item][0])
          cell.firstSound = URL(fileURLWithPath: Bundle.main.path(forResource: arrayOfSound[indexPath.item][0], ofType: "mp3")!)
          cell.imagesName2.image = UIImage(named: arrayOfArray[indexPath.item][1])
          cell.secondSound = URL(fileURLWithPath: Bundle.main.path(forResource: arrayOfSound[indexPath.item][1], ofType: "mp3")!)
          cell.imagesName3.image = UIImage(named: arrayOfArray[indexPath.item][2])
          cell.imagesName4.image = UIImage(named: arrayOfArray[indexPath.item][3])
          cell.imagesName5.image = UIImage(named: arrayOfArray[indexPath.item][4])
          cell.imagesName6.image = UIImage(named: arrayOfArray[indexPath.item][5])
          cell.imagesName7.image = UIImage(named: arrayOfArray[indexPath.item][6])
          cell.imagesName8.image = UIImage(named: arrayOfArray[indexPath.item][7])
          cell.imagesName9.image = UIImage(named: arrayOfArray[indexPath.item][8])
          cell.imagesName10.image = UIImage(named: arrayOfArray[indexPath.item][9])
          cell.imagesName11.image = UIImage(named: arrayOfArray[indexPath.item][10])
          cell.imagesName12.image = UIImage(named: arrayOfArray[indexPath.item][11])
          cell.imagesName13.image = UIImage(named: arrayOfArray[indexPath.item][12])
          cell.imagesName14.image = UIImage(named: arrayOfArray[indexPath.item][13])
          cell.imagesName15.image = UIImage(named: arrayOfArray[indexPath.item][14])
          cell.imagesName16.image = UIImage(named: arrayOfArray[indexPath.item][15])
          cell.imagesName17.image = UIImage(named: arrayOfArray[indexPath.item][16])
          cell.imagesName18.image = UIImage(named: arrayOfArray[indexPath.item][17])
          cell.imagesName19.image = UIImage(named: arrayOfArray[indexPath.item][18])
          cell.imagesName20.image = UIImage(named: arrayOfArray[indexPath.item][19])
          cell.imagesName21.image = UIImage(named: arrayOfArray[indexPath.item][20])
          cell.imagesName22.image = UIImage(named: arrayOfArray[indexPath.item][21])
          cell.imagesName23.image = UIImage(named: arrayOfArray[indexPath.item][22])
          cell.imagesName24.image = UIImage(named: arrayOfArray[indexPath.item][23])
          cell.imagesName25.image = UIImage(named: arrayOfArray[indexPath.item][24])
          cell.imagesName26.image = UIImage(named: arrayOfArray[indexPath.item][25])
          return cell
      }
      
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: view.frame.width, height: view.frame.height)
      }
      
     public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 0
      }

}


class newListenCard : UICollectionViewCell {
    
    
    
    var soundURI: URL?
    var audioPlayer = AVAudioPlayer()
    var firstSound : URL = {
        let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "Alif", ofType: "mp3")!)
        return sound
    }()
    
    var secondSound : URL = {
        let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "Alif", ofType: "mp3")!)
        return sound
    }()
    
    
    public func playfirstSounds() {
        do {
            let uri = firstSound
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.play()
        } catch {
            
        }
    }
    
    public func playSecondSounds() {
        do {
            let uri = secondSound
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    let ornament : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "ornamen.png")
        return images
    }()
    
    
    let container : UIView = {
        
        let ctnr = UIView()
        ctnr.backgroundColor = .white
        return ctnr
    }()
    
    let images : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ngaji.jpg")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let layers : UIView = {
        let lyr = UIView()
        lyr.backgroundColor = UIColor.init(displayP3Red: 236/255, green: 221/255, blue: 191/255, alpha: 1)
        
        
        return lyr
    }()
    
    
    

    

    let imagesName1 : UIImageView = {

        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        //images.isUserInteractionEnabled = true
        //images.addGestureRecognizer(tap)
        return images
    }()
    

    let imagesName2 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        //images.isUserInteractionEnabled = true
        return images
    }()
    
    let imagesName3 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName4 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName5 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName6 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName7 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName8 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName9 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName10 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName11 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName12 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName13 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName14 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName15 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName16 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName17 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName18 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName19 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName20 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName21 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName22 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName23 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName24 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName25 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let imagesName26 : UIImageView = {
        let images = UIImageView()
        images.image = UIImage(named: "Kha.jpg")
        return images
    }()
    
    let line1 : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    let line2 : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    let line3 : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    let line4 : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    let line5 : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Listen Mode"
        label.font = UIFont.init(name: "Helvetica-Bold", size: 24)
        
        
        return label
    }()
    
    let quizButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        btn.imageView?.tintColor = .black
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: -5, bottom: 5, right: 0)
        btn.setTitle("Quiz", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(goToQuiz), for: .touchUpInside)
        return btn
    }()
    
    @objc func goToQuiz() {
        print("aaaa")
        let qm2 = QuizMenu2()
        qm2.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)
        PlaygroundPage.current.needsIndefiniteExecution = true
        PlaygroundPage.current.liveView = UINavigationController(rootViewController: qm2)
        
        //navigationController?.pushViewController(qm2, animated: true)
    }
    
    lazy var lineArray = [self.line1, self.line2, self.line3, self.line4, self.line5]
    
    lazy var imagesArrays = [self.imagesName1, self.imagesName2, self.imagesName3, self.imagesName4, self.imagesName5, self.imagesName6,self.imagesName7, self.imagesName8, self.imagesName9, self.imagesName10, self.imagesName11,self.imagesName12,self.imagesName13, self.imagesName14, self.imagesName15, self.imagesName16,self.imagesName17, self.imagesName18, self.imagesName19, self.imagesName20, self.imagesName21, self.imagesName22,self.imagesName23, self.imagesName24, self.imagesName25, self.imagesName26]

    let firstrow = [2, 8, 14, 20]
    let secondrow = [3, 9, 15, 21]
    let thirdrow = [0, 4, 10, 16, 22]
    let fourthrow = [1, 5, 11, 17, 23]
    let fifthrow = [6, 12, 18, 24]
    let sixthrow = [7, 13, 19, 25]

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        setupLayout()
        setupTap()
    }
    
    
    @objc func firstImageTapped() {
        print("aaaa")
        playfirstSounds()
    }
    
    @objc func secondImageTapped() {
        print("bbbb")
        playSecondSounds()
    }
    
    @objc func handleNext() {
        print("next tapped")
    }
    
//    @objc func handlePrev() {
//        print("prev tapped")
//        let nextIndex = max(pageControl.currentPage - 1, 0)
//        //let indexPath = IndexPath(item: nextIndex, section: 0)
//        pageControl.currentPage = nextIndex
//    //    collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//    }


    func setupTap() {
        for i in 0 ... imagesArrays.count - 1 {
            imagesArrays[i].isUserInteractionEnabled = true
        }
        for i in 0 ... imagesArrays.count - 1 {
                
            if i % 2 == 0  {
                imagesArrays[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(firstImageTapped)))
            } else {
                imagesArrays[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secondImageTapped)))
            }
        }
    }
    
    
    func setupLayout() {

        addSubview(layers)
        layers.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        layers.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        layers.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        layers.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        layers.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(ornament)
        ornament.centerXAnchor.constraint(equalTo: layers.centerXAnchor).isActive = true
        ornament.centerYAnchor.constraint(equalTo: layers.centerYAnchor, constant: -10).isActive = true
        ornament.heightAnchor.constraint(equalToConstant: 648/1.75).isActive = true
        ornament.widthAnchor.constraint(equalToConstant: 895/1.75).isActive = true
        ornament.translatesAutoresizingMaskIntoConstraints = false
        
        layers.addSubview(container)
        container.centerXAnchor.constraint(equalTo: layers.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: layers.centerYAnchor, constant: -20).isActive = true
        container.heightAnchor.constraint(equalToConstant: 500/1.75).isActive = true
        container.widthAnchor.constraint(equalToConstant: 748/1.75).isActive = true
        container.translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(previousButton)
//        previousButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12).isActive = true
//        previousButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
//        previousButton.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(nextButton)
//        nextButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12).isActive = true
//        nextButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: container.topAnchor, constant: -6).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true

        
        for i in 0 ... imagesArrays.count - 1 {
            addSubview(imagesArrays[i])
            imagesArrays[i].heightAnchor.constraint(equalToConstant: 64/1.75).isActive = true
            imagesArrays[i].widthAnchor.constraint(equalToConstant: 64/1.75).isActive = true
            imagesArrays[i].translatesAutoresizingMaskIntoConstraints = false
        }
        
        //TOP ANCHOR
        
        for i in 0 ... 1 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 36/1.75).isActive = true
        }
        
        for i in 2 ... 7 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 115.6/1.75).isActive = true
        }
        
        for i in 8 ... 13 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 201.17/1.75).isActive = true
        }
        
        for i in 14 ... 19 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 285/1.75).isActive = true
        }
        
        for i in 20 ... 25 {
            imagesArrays[i].topAnchor.constraint(equalTo: container.topAnchor, constant: 370/1.75).isActive = true
        }
        
        //Trailing Anchor
        
        for i in firstrow {
            imagesArrays[i].trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -34.78/1.75).isActive = true
        }
        
        for i in secondrow {
            imagesArrays[i].trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -106.77/1.75).isActive = true
        }
        
        for i in thirdrow {
            imagesArrays[i].trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -311.75/1.75).isActive = true
        }
        
        for i in fourthrow {
            imagesArrays[i].trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -385.43/1.75).isActive = true
        }
        
        for i in fifthrow {
            imagesArrays[i].trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -600/1.75).isActive = true
        }
        
        for i in sixthrow {
            imagesArrays[i].trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -669.18/1.75).isActive = true
        }
        
        
        
        for i in 0 ... lineArray.count - 1 {
            addSubview(lineArray[i])
            lineArray[i].widthAnchor.constraint(equalToConstant: 692/1.75).isActive = true
            lineArray[i].heightAnchor.constraint(equalToConstant: 1).isActive = true
            lineArray[i].centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            lineArray[i].translatesAutoresizingMaskIntoConstraints = false
        }
        

        line1.topAnchor.constraint(equalTo: container.topAnchor, constant: 96.43/1.75).isActive = true
        line2.topAnchor.constraint(equalTo: line1.topAnchor, constant: 88/1.75).isActive = true
        line3.topAnchor.constraint(equalTo: line2.topAnchor, constant: 88/1.75).isActive = true
        line4.topAnchor.constraint(equalTo: line3.topAnchor, constant: 88/1.75).isActive = true
        line5.topAnchor.constraint(equalTo: line4.topAnchor, constant: 88/1.75).isActive = true

    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
