//
//  ViewController.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/8/5.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    var datas = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        _initTableView()

        datas = [
            "BubbleSort",
            "SelectionSort",
            "QuickSort",
            "BinarySearch",
            "toSum_1",
            "intersect_350",
            "longestCommonPrefix_14"
        ]
    }

    private func _initTableView() {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height - 88 - 32), style: .plain)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44.0
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let spaceName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else { return }
        let className = datas[indexPath.row]
        let vcCalss: AnyClass? = NSClassFromString(spaceName + "." + className)
        guard let typeClass = vcCalss as? UIViewController.Type else { return }
        let calssInstance = typeClass.init()
        navigationController?.pushViewController(calssInstance, animated: true)
    }
}

