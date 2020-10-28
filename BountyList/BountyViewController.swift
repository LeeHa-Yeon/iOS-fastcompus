//
//  BountyViewController.swift
//  BountyList
//
//  Created by 이하연 on 2020/10/27.
//

import UIKit

class BountyViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    // 데이터 세팅
    let nameList = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro"]
    let bountyList = [3300000,50,4400000,3000000,1600000,800000,77000000,12000000]
    
    // prepare : segue가 수행되기 직전에 준비하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터를 줄 거다.
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.buntry = bountyList[index]
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    // UITableViewDataSource 에서 질문하는거에 대해 답
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
     // 어떻게 표현할 거니?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 재활용되는 놈을 가져오는 dequeueReusableCell
        // 여러개 셀들이 있을 때 셀들을 구분하는 구분자 이름을 cell로 지정
        // 셀 위치 : indexpath
        // optional이 될 수도 있으니까 guard 넣기 - Optional binding(guard) 버전
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLable.text = nameList[indexPath.row]
//        cell.bountyLable.text = "\(bountyList[indexPath.row])"
//        return cell
        
// 위의 코드와 같은데 Optional binding(if let) 버전
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell{
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgView.image = img
            cell.nameLable.text = nameList[indexPath.row]
            cell.bountyLable.text = "\(bountyList[indexPath.row])"
            
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    
    /* 이렇게 코드만 작성하고 실행하면 위의 코드가 적용이 안되있음
     table view를 bounty view controller에 control로 끌어당겨서 "어떠한 질문을 할건지 물어보자" 선택 후 연결한다.
     여기선 dataSource, delegate 를 연결
     -> connections inspector 를 보면
       " 아 테이블 뷰가 dataSource라는 대리인을 통해서 bounty view controller 한테 물어보겠구나 "
       " delegate라는 대리인을 통해서 클릭했을 때 어떻게 할거야? " 라고 물어보겠구나 */
    
    
    // UITableViewDelegate
    // 클릭할때 어떻게 반응할거야
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 몇번째 아이가 클릭된지 알 기 위해서 indexPath 출력
        // indexPath : 몇번째의 정보를 가지고 있는지
        print("\(indexPath.row)")
        // 연결(Segue 세그웨이)할 뿐만 아니라 수행해라
        // 구분자 : showDetail , sender : segue를 수행하는데 있어서 오브젝트를 같이 껴서 보낼 때
        // sender에게 이게 몇 번째 셀이다 라는 정보를 줌
        performSegue(withIdentifier: "showDetail", sender: indexPath.row )
    }
    

}

//  custom cell 만들기
// custom cell = ListCell

class ListCell : UITableViewCell {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var nameLable :  UILabel!
    @IBOutlet weak var bountyLable :  UILabel!
}

// 위의 ListCell을 만든 후 스토리보드로 가서 cell의 identity inspector로 가기 -> class 명을 ListCell로 적기  
