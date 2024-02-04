//
//  ViewController.swift
//  Codepath-prework
//
//  Created by Vuong Nguyen on 1/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Function to show random photos.
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        // imageView.backgroundColor =
        return imageView
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Magic lies here", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y: 0, width: 500, height: 500)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y:
                view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
            )
    }
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {return}
        imageView.image = UIImage(data: data)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        Changebackgroundcolor()
    }

    @IBAction func Changebackgroundcolor() {
        let randomColor = changeColor()
        view.backgroundColor = randomColor
        func changeColor() -> UIColor{
            
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            
            return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        }
    }
}

