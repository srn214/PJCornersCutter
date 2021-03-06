//
//  TestViewController.swift
//  CornersCutter
//
//  Created by Zoey Weng on 2018/1/14.
//  Copyright © 2018年 Zoey Weng. All rights reserved.
//

import UIKit
import GDPerformanceView_Swift

class TestTableViewController: UIViewController {

    var performanceView = GDPerformanceMonitor.sharedInstance
    
    private lazy var tableView : UITableView = {
        let tempTableView = UITableView(frame: .zero, style: .plain)
        return tempTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    func initView() {
        self.view.addSubview(tableView)
        self.view.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.register(TestCellTableViewCell.classForCoder(), forCellReuseIdentifier: "TestCellTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        self.performanceView.startMonitoring(configuration: { (textLabel) in
            textLabel?.backgroundColor = .black
            textLabel?.textColor = .white
            textLabel?.layer.borderColor = UIColor.black.cgColor
            textLabel?.frame = CGRect(x: 100.0, y: 100.0, width: 60.0, height: 40.0)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TestTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //不使用cell复用以来查看FPS值
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TestCellTableViewCell", owner: nil, options: nil)?.first as? TestCellTableViewCell
        cell?.initView()
        cell?.testModel = TestModel()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension TestTableViewController: UITableViewDelegate {
    
}
