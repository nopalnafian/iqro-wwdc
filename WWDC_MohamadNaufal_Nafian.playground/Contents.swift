import UIKit
import PlaygroundSupport

let nm = NewMenu()
nm.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)
let layout = UICollectionViewFlowLayout()
layout.scrollDirection = .horizontal
let ncv = ListenMode(collectionViewLayout: layout)
ncv.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)



let qm2 = QuizMenu2()
qm2.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)

//let qm = QuizMenu()
//qm.preferredContentSize = CGSize(width: 1024/1.75, height: 768/1.75)
//

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = UINavigationController(rootViewController: nm)
