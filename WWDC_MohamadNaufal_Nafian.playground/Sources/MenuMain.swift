
import UIKit
import PlaygroundSupport


public class NewMenu: UIViewController {
    

    
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
    
    let container : UIView = {
        let ctnr = UIView()
        ctnr.layer.cornerRadius = 10
        ctnr.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        return ctnr
        
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Iqro"
        label.font = UIFont.init(name: "Helvetica-Bold", size: 32)
        
        return label
    }()
    
    let descTitle : UILabel = {
        let label = UILabel()
        label.text = "A Fast Way to Learn to Read the Quran"
        label.font = UIFont.init(name: "Helvetica-Light", size: 10)
        
        return label
    }()
    
    let persuasiveTitle : UILabel = {
        let label = UILabel()
        label.text = "Iqro is one of the most popular method for learning Arabhic leters and pronunciation  in Indonesia as well as other countries in Southeast Asia. \n \n Start your journey with this amazing learning experience !"
        label.textAlignment = .center
        label.numberOfLines = 7
        label.font = UIFont.init(name: "Helvetica-Light", size: 14)
        
        return label
    }()
    
    let startButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Listen", for: .normal)
        btn.titleLabel?.textColor = .black
        btn.titleLabel?.font = UIFont(name: "Helvetica-Light", size: 16)
        btn.backgroundColor = UIColor.init(displayP3Red: 205/255, green: 180/255, blue: 143/255, alpha: 1)
        btn.layer.cornerRadius = 0
        btn.layer.borderWidth = 0
        //btn.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        //btn.layer.shadowColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.6)
        //btn.layer.shadowOffset = CGSize(width: 0, height: 3)
        //btn.layer.shadowOpacity = 8
        //btn.layer.shadowRadius = 1
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(startKuy), for: .touchUpInside)
        
        return btn
    }()
    

    let testButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Quiz", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont(name: "Helvetica-Light", size: 16)
        btn.backgroundColor = UIColor.init(displayP3Red: 81/255, green: 54/255, blue: 14/255, alpha: 1)
        btn.layer.cornerRadius = 0
        btn.layer.borderWidth = 0
        //btn.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        //btn.layer.shadowColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0.6)
        //btn.layer.shadowOffset = CGSize(width: 0, height: 3)
        //btn.layer.shadowOpacity = 8
        //btn.layer.shadowRadius = 1
        //btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(quiz), for: .touchUpInside)
        
        return btn
    }()
    

    
    public override func viewDidLoad() {
        let view = UIView()
        self.view = view
        //navigationController?.setNavigationBarHidden(true, animated: true)
        //navigationController?.navigationBar.isHidden = true
        navigationItem.title = "Menu"
        view.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 236/255, green: 221/255, blue: 191/255, alpha: 0)
        setupLayout()
    }
    
    
    @objc func startKuy() {
        print("start")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let ncv = ListenMode(collectionViewLayout: layout)
        ncv.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)

        PlaygroundPage.current.needsIndefiniteExecution = true
        navigationController?.pushViewController(ncv, animated: true)
    }

    @objc func quiz() {
        print("aaa")
        let qm2 = QuizMenu2()
        qm2.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)
        PlaygroundPage.current.needsIndefiniteExecution = true
        navigationController?.pushViewController(qm2, animated: true)
    }
    func setupLayout() {
        view.addSubview(images)
        images.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        images.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        images.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -200).isActive = true
        images.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        images.translatesAutoresizingMaskIntoConstraints = false
        
        images.addSubview(layer)
        layer.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        layer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        layer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        layer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        layer.translatesAutoresizingMaskIntoConstraints = false
        
        layer.addSubview(container)
        container.centerXAnchor.constraint(equalTo: layer.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: layer.centerYAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 540/1.75).isActive = true
        container.widthAnchor.constraint(equalToConstant: 610/1.75).isActive = true
        container.translatesAutoresizingMaskIntoConstraints = false
        
        layer.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: layer.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 24/1.75).isActive = true
        
        layer.addSubview(descTitle)
        descTitle.translatesAutoresizingMaskIntoConstraints = false
        descTitle.centerXAnchor.constraint(equalTo: layer.centerXAnchor).isActive = true
        descTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        
        layer.addSubview(persuasiveTitle)
        persuasiveTitle.translatesAutoresizingMaskIntoConstraints = false
        persuasiveTitle.centerXAnchor.constraint(equalTo: layer.centerXAnchor).isActive = true
        persuasiveTitle.topAnchor.constraint(equalTo: descTitle.bottomAnchor, constant: 36/1.75).isActive = true
        persuasiveTitle.heightAnchor.constraint(equalToConstant: 240/1.75).isActive = true
        persuasiveTitle.widthAnchor.constraint(equalToConstant: 481/1.75).isActive = true
        
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.widthAnchor.constraint(equalToConstant: 156/1.75).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50/1.75).isActive = true
        startButton.trailingAnchor.constraint(equalTo: container.centerXAnchor, constant: -40/1.75).isActive = true
        startButton.topAnchor.constraint(equalTo: persuasiveTitle.bottomAnchor, constant: 24/1.75).isActive = true
        
        
        view.addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.widthAnchor.constraint(equalToConstant: 156/1.75).isActive = true
        testButton.heightAnchor.constraint(equalToConstant: 50/1.75).isActive = true
        testButton.leadingAnchor.constraint(equalTo: container.centerXAnchor, constant: 40/1.75).isActive = true
        testButton.topAnchor.constraint(equalTo: persuasiveTitle.bottomAnchor, constant: 24/1.75).isActive = true
    }
}

