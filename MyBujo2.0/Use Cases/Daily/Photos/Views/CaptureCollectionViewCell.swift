//
//  CaptureCollectionViewCell.swift
//  MyBujo2.0
//
//  Created by Lucas Tavares on 12/09/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CaptureCollectionViewCell: UICollectionViewCell, ViewCode {
    
    let captureImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
		imgView.contentMode = .scaleToFill
        return imgView
    }()
    
	func setupCell(image: UIImage) {
        setupView()
		let longPress = UILongPressGestureRecognizer(target: self, action: #selector(shouldSelectPhotos(_:)))
		addGestureRecognizer(longPress)
        captureImageView.image = image
	}
    
    func buildViewHierarchy() {
        addSubview(captureImageView)
    }
    
	func setupConstraints() {
        NSLayoutConstraint.activate([
            captureImageView.topAnchor.constraint(equalTo: topAnchor),
            captureImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            captureImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            captureImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupAdditionalConfigurantion() {
        backgroundColor = .white
    }
	
	
	@objc private func shouldSelectPhotos(_ sender: UILongPressGestureRecognizer) {
		self.shake()
	}
}
