//
//  DetailViewController.swift
//  TDDCaseStudy
//
//  Created by alexis on 19/04/21.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedImage {
           imageView.image  = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
       imageView.backgroundColor = .white
       imageView.contentMode = .scaleAspectFit
       view = imageView
    }
}
