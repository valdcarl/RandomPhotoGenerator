//
//  ViewController.swift
//  RandomPhotoGenerator
//
//  Created by Carlos Valdez on 1/12/23.
//

import UIKit

class ViewController: UIViewController {

    // vars (objects)
    // Lets bring in an imageview
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill  // so that the image view scales to fit screen, no stretch width/height
        imageView.backgroundColor = .white        // make it white so we can actually see the view box since not assigned yet
        return imageView                          // returm that image view
    }()
    
    // lets create a button as well
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray                  // backgrond color of button
        button.setTitle("GENERATE", for: .normal)       // normal state
        button.setTitleColor(.black, for: .normal)      // set the title color to black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view below.
        // this is the main function view controller call to see what appears on a screen
        
        // let's change the color of the background system
        view.backgroundColor = .systemOrange  // makes background of the view to orange
        
        // for imageview
        view.addSubview(imageView)          // add it to the view
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)  // give dimens for the frame of the view
        imageView.center = view.center                                 // center to the center of the view
        
        // for button
        view.addSubview(button)
        // call the getRandomPhoto function we created to actually populate the imageview with a random image
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    } // end viewDidLoad
    
    @objc func didTapButton() {     //objc to attach that to a button
        getRandomPhoto()
    }
    
    // for the layout of the button
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55)
    }
    
    // function to get a random photo
    func getRandomPhoto() {
        // function named urlString, with the attached url in quotes
        let urlString = "https://source.unsplash.com/random/600x600" // decided on 600x600 image size
        
        // convert the url string into an actual url
        let url = URL(string: urlString)!       //! tells swift that this URL is valid/exists
        
        // get contents of url via data
        // try? is like "try to get this Data content"
        // no else, unless we want something else to happen
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        // once we have data, create an image from the data
        imageView.image = UIImage(data: data)
    }  // end getRandomPhoto

    

}

