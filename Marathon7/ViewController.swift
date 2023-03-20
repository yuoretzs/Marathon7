//
//  ViewController.swift
//  Marathon7
//
//  Created by юра on 19.03.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView = UIImageView()
    var scrollView = UIScrollView()
    let srollHeight = CGFloat(1500)
    let imageHeight = CGFloat(270)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1230018809, green: 0.218865037, blue: 0.3472043872, alpha: 1)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: imageHeight))
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        
        view.addSubview(scrollView)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "truena")
        scrollView.addSubview(imageView)
        
        let contentView = UIView(frame: CGRect(x: 0, y: imageView.frame.maxY, width: view.frame.width, height: srollHeight))
        contentView.backgroundColor = #colorLiteral(red: 0.1230018809, green: 0.218865037, blue: 0.3472043872, alpha: 1)
        scrollView.addSubview(contentView)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: imageView.frame.height + contentView.frame.height)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let topInset = imageView.frame.height - 48
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
        scrollView.indicatorStyle = .white
        if yOffset < 0 {
            imageView.frame = CGRect(x: 0, y: yOffset, width: UIScreen.main.bounds.width, height: imageHeight - yOffset)
        }
    }
}





