//
//  CalendarViewController.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import UIKit
import React

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
       let label = UILabel(frame: CGRect.zero)
       label.text = "CalendarViewController"
       label.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(label)
       NSLayoutConstraint.activate([
           label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
       ])
    }
}
