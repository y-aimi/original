//
//  ViewController.swift
//  Overseas
//
//  Created by 相見佳輝 on 2020/03/10.
//  Copyright © 2020 相見佳輝. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //selfで返さないと配列が表示されない
        tableView.delegate = self
        tableView.dataSource = self
    }

   
    @IBOutlet weak var tableView: UITableView!
    
    let overseasList = [" 1位.アメリカ"," 2位.中国"," 3位.オーストラリア"," 4位.タイ"," 5位.カナダ",
                        " 6位.イギリス"," 7位.ブラジル"," 8位.ドイツ"," 9位.フランス","10位.韓国",
                        "11位.シンガポール","12位.マレーシア","13位.ハワイ","14位.台湾","15位.インドネシア",
                        "16位.ニュージーランド","17位.フィリピン","18位.ベトナム","19位.イタリア","20位.スペイン"]
    
    //NSURLでstring型をURL型に変換
    let overseasWeb = [NSURL(string:"https://www.kaigaiijyu.com/country/usa/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/china/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/australia/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/thailand/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/canada/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/uk/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/brazil/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/germany/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/france/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/korea/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/singapore/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/malaysia/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/hawaii/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/taiwan/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/indonesia/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/newzealand/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/philippines/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/vietnam/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/italy/index.html"),
                       NSURL(string:"https://www.kaigaiijyu.com/country/spain/index.html")
    ]
    
    
    //配列の個数をreturnで返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return overseasList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "overseasCell", for: indexPath)
        
        //セルに表示する値を設定する
        cell.textLabel!.text = overseasList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルをタップした時の処理を書く
        
        //ハイライト解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        //safariを開く
        let safariViewController = SFSafariViewController(url: overseasWeb[indexPath.row]! as URL)
        
        //delegateの通知先を自分自身に
        safariViewController.delegate = self
        
        //safariViewが開かれる
        present(safariViewController, animated: true, completion: nil)
    }
    
    //SafariViewが閉じられた時に呼ばれるdelegateメソッド
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        //SafariViewを閉じる
        dismiss(animated: true, completion: nil)
    }
    
    
}


