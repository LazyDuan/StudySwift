//
//  ViewController.swift
//  StudySwift
//
//  Created by macbook on 2021/5/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Swift 小练习"
       
        print(Person(name: "swift", id: 1).name)
        let user = User.init(dictionary: ["name":"duan","message":"hello"])
        print(user?.name ?? "none")
        
        let request = UserRequest(name: "banners")
        request.send { banner,error  in
            if let banner = banner {
                print("\(banner.image) from \(banner.title)")
            }
        }
        self.view.addSubview(self.tableView)
    }
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50;
        return tableView
    }()

}


extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
}
