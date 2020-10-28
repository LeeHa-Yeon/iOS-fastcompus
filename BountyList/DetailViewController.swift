//
//  DetailViewController.swift
//  BountyList
//
//  Created by 이하연 on 2020/10/28.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var nameLable :  UILabel!
    @IBOutlet weak var bountyLable :  UILabel!
    
    var name : String?
    var buntry:Int?
    
    // viewDidLoad는 이 뷰컨트롤러가 메모리에 올라온 시점에 호출됨 , 즉 바로 직전에 호출되므로 updateUI를 여기서 호출시키자
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI(){
        
        if let name = self.name , let buntry = self.buntry {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLable.text =  name
            bountyLable.text = "\(buntry)"
        }
    }

    @IBAction func close(_ sender: Any) {
        // dismiss 사라지다
        // completion은 이 버튼이 사라지고나서 그 후에 동작되어야 할 것들 적어주면 그 이후에 동작됨
        dismiss(animated: true , completion: nil)
    }
    
}
