//
//  MasterViewController.swift
//  MyBujo2.0
//
//  Created by Lucas Tavares on 20/08/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: String, fontSize: CGFloat, textColor: UIColor) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(name: font, size: fontSize)
        self.textAlignment = .center
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.contentHorizontalAlignment = .left
    }
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}


class MasterViewController: UIViewController, ViewCode {
    
    let monthLabel = UILabel(text: "Tuesday", font: "Avenir Next", fontSize: 30, textColor: UIColor(named:"TitleColor")!)
    let dayLabel = UILabel(text: "13/08", font: "Avenir Next", fontSize: 60, textColor: UIColor(named:"TitleColor")!)
    let yearLabel = UILabel(text: "2019", font: "Avenir Next", fontSize: 30, textColor:  UIColor(named:"TitleColor")!)

    let myJourneyButton = UIButton(title: "🏠 My Journey")
    let myTodayButton = UIButton(title: "📅 My Today")
    let supportButton = UIButton(title: "⛑ Support")
    let settingsButton = UIButton(title: "⚙️ Settings")
    
    var viewControllers: [UINavigationController] = []
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
        myTodayButton.setTitleColor(UIColor(named:"TitleColor")!, for: .normal)
        myJourneyButton.setTitleColor(UIColor(named:"TitleColor")!, for: .normal)
        supportButton.setTitleColor(UIColor(named:"TitleColor")!, for: .normal)
        settingsButton.setTitleColor(UIColor(named:"TitleColor")!, for: .normal)
        myTodayButton.addTarget(self, action: #selector(didShowMyTodayViewController(_:)), for: .touchDown)
        myJourneyButton.addTarget(self, action: #selector(didShowMyJourneyViewController(_:)), for: .touchDown)
    }
    
    
    func buildViewHierarchy() {
        view.addSubviews([monthLabel, dayLabel, yearLabel, myTodayButton,
                          myJourneyButton, supportButton, settingsButton ])
    }
    
    func setupConstraints() {
     
        
        NSLayoutConstraint.activate([
            
            monthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            monthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            dayLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor , constant: 0),
            dayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            yearLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 0),
            yearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            myTodayButton.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 32),
            myTodayButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myTodayButton.widthAnchor.constraint(equalToConstant: 150),
            
            myJourneyButton.topAnchor.constraint(equalTo: myTodayButton.bottomAnchor, constant: 16),
            myJourneyButton.centerXAnchor.constraint(equalTo: myTodayButton.centerXAnchor),
            myJourneyButton.widthAnchor.constraint(equalToConstant: 150),
            
            supportButton.topAnchor.constraint(equalTo: myJourneyButton.bottomAnchor, constant: 16),
            supportButton.centerXAnchor.constraint(equalTo: myTodayButton.centerXAnchor),
            supportButton.widthAnchor.constraint(equalToConstant: 150),
            
            settingsButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32),
            settingsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: 150) 
        ])
    }
    
    func setupAdditionalConfigurantion() {
        view.backgroundColor = UIColor(named: "BlueBackground")
    }
    
    @objc func didShowMyJourneyViewController(_ sender: UIButton) {
        self.splitViewController?.preferredDisplayMode = .automatic
        let navigationController = viewControllers[1]
        self.splitViewController?.showDetailViewController(navigationController, sender: nil)
    }
    
    @objc func didShowMyTodayViewController(_ sender: UIButton) {
        
        
        let navigationController = viewControllers[0]
        self.splitViewController?.showDetailViewController(navigationController, sender: nil)

    }
}
